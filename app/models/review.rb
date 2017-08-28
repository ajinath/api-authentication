class Review
  include Mongoid::Document
  field :name, type: String
  field :rating, type: Integer
  field :title, type: String
  field :desc, type: String

  # Association
  embedded_in :book
end
