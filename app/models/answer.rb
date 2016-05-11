class Answer < ActiveRecord::Base
  has_many :votes, as: :voteable
  has_many :responses, as: :respondable
  belongs_to :the_one_who_answers, class_name: "User"
  belongs_to :question
end
