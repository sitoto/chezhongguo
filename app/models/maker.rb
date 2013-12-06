class Maker
  include Mongoid::Document
  field :name, type: String
  field :name_pinyin, type: String
  field :summary, type: String
  field :site, type: String
	field :display_index

  belongs_to :brand
  has_many :car_models

  before_save :update_name_pinyin

  protected
  def update_name_pinyin
    self.name_pinyin = Pinyin.t(self.name, '').downcase.to_s 
  end
end
