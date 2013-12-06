#encoding: utf-8
class Node
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :summary
  field :sort, type: Integer, :default => 0 
  field :questions_count, type: Integer, :default => 0


  has_many :questions

  validates_presence_of :name, :summary
  validates_uniqueness_of :name
end
