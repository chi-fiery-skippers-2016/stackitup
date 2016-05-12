class User < ActiveRecord::Base
  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :theOneWhoAnswers_id
  has_many :responses
  has_many :votes, foreign_key: :voter_id
end
