class Book
  include Mongoid::Document
  include Mongoid::Search

  #field
  field :name, type: String
  field :short_desc, type: String
  field :long_desc, type: String
  field :chapter_index, type: Integer
  field :dop, type: Date
  field :genre, type: Array, default: []

  # Association
  embeds_many :reviews
  has_and_belongs_to_many :authors

  search_in :name, :short_desc, :long_desc
  
  GENRE = ['science', 'fiction', 'satire', 'drama', 'action and adventure',
  'romance', 'mystery', 'horror', 'self help', 'Fantasy']
end
