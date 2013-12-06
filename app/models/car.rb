class Car
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :name_pinyin, type: String
  field :brand, type: String
  field :model, type: String
  field :maker, type: String
  field :year, type: Integer
  field :price, type: Float
  field :pailiang, type: String
  field :biansuxiang, type: String
  field :car_use, type: String
  field :car_type, type: String

  field :temp_car_url, type: String
  field :temp_pic_url, type: String

  mount_uploader :image, CarPhotoUploader

  index({name: 1})
  index({name_pinyin: 1})

  belongs_to :car_model
  embeds_many :parameters

  scope :search_name, lambda { |name| where(:name => /#{name}/) }
end
