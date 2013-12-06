class Answer
  include Mongoid::Document
  include Mongoid::Timestamps


  field :content, type: String
  field :level, type: Integer
  field :good, type: Integer, :default => 0
  field :bad, type: Integer,  :default => 0

  belongs_to :question
  belongs_to :user
end
