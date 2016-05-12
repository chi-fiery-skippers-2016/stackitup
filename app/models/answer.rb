class Answer < ActiveRecord::Base
  has_many :votes, as: :voteable
  has_many :responses, as: :respondable
  belongs_to :theOneWhoAnswers, class_name: "User"
  belongs_to :question
end
