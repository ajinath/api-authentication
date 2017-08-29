class Book
  include Mongoid::Document
  include Mongoid::FullTextSearch

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

  GENRE = ['science', 'fiction', 'satire', 'drama', 'action and adventure',
  'romance', 'mystery', 'horror', 'self help', 'Fantasy']
  
  fulltext_search_in :name, genre: GENRE
  
end
