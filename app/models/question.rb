# coding: utf-8
class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String, :default => ""
  field :content, type: String
  field :good, type: Integer, :default => 0
  field :bad, type: Integer,  :default => 0
  field :answers_count, type: Integer, :default => 0
  field :views_count,   type: Integer, :default => 0
  
  field :replied_at,  type: DateTime
  field :suggested_at, type: DateTime

  # 节点名称 - cache 字段用于减少列表页的查询
  field :node_name
  # 删除人
  field :who_deleted

  index :node_id => 1
  index :user_id => 1

  belongs_to :node
  belongs_to :user
  has_many   :answers

  attr_protected :user_id
#  attr_accessor :current_user_id
  validates_presence_of :user_id, :title

  #scopes
  #
  scope :last_actived, desc("replied_at")
  #
  scope :fields_for_list, without(:content)
  

  def self.find_by_title(title)
    first(:conditions => {:title => title})
  end


before_save :store_cache_fields
  def store_cache_fields
    self.node_name = self.node.try(:name) || ""
  end
  
before_create :init_replied_at_on_create
  def init_replied_at_on_create
    self.replied_at = Time.now if self.replied_at.blank?
  end
  

end
