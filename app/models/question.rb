class Question < ActiveRecord::Base
  has_many :votes, as: :votable
  belongs_to :tagging
  has_many :tags, :through :tagging
  has_many :answers
  has_many :responses, as: :respondable
  belongs_to :author, class_name: "User"
end
