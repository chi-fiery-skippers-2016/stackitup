class Question < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :answers
  has_many :responses, as: :respondable
  belongs_to :author, class_name: "User"
end
