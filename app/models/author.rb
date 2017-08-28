class Author
  include Mongoid::Document
  field :name, type: String
  field :bio, type: String
  field :picture, type: String
  field :academics, type: String
  field :awards, type: String

  # Association
  has_and_belongs_to_many :books

end
