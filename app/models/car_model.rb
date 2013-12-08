class CarModel
  include Mongoid::Document
  field :name, type: String
  field :name_pinyin, type: String
  field :name_en, type: String
  field :price_low, type: String   #厂商指导最低价
  field :price_top, type: String   #厂商指导最高价
  field :pailiang, type: Array, default: []     #排量 1.6L 2.0L 2.2L
  field :biansuxiang, type: Array, default: []  #变速箱 手动/自动
  field :status, type: String    #在产 停产 未上市
  field :country, type: String   #国家
  field :summary, type: String   #说明
  field :car_type, type: String   #微型车、中型车
  field :car_use, type: String    #家用、商用


  field :temp_model_url
  field :temp_pic_url

  mount_uploader :image, CarModelPhotoUploader


  belongs_to :maker
  has_many :cars
  scope :search_name, lambda { |name| where(:name => /#{name}/) }

end
