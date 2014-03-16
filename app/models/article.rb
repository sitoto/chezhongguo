class Article
  include Mongoid::Document
  field :mytitle, type: String
  field :mydescription, type: String
  field :tags, type: Array
  field :only_author, type: Mongoid::Boolean
  field :published, type: Mongoid::Boolean
  field :title, type: String
  field :author, type: String
  field :class_name, type: String
  field :first_time, type: String
  field :last_time, type: String
  field :from_name, type: String
  field :from_url, type: String
  field :last_url, type: String
  field :from_ip, type: String
  field :status, type: Integer
  field :pages_count, type: Integer
  field :words_count, type: String
  field :like_count, type: Integer
  field :hits, type: Integer
end
