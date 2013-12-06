class Autopart
  include Mongoid::Document
  field :name, type: String
  field :price, type: String
  field :image, type: String
  field :description, type: String
  field :remote_url, type: String
end
