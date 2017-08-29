class Author
  include Mongoid::Document
  include Mongoid::FullTextSearch

  field :name
  field :bio, type: String
  field :picture, type: String
  field :academics, type: String
  field :awards, type: String

  # Association
  has_and_belongs_to_many :books

  fulltext_search_in :name

end
