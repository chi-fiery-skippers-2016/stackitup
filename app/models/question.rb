class Question < ActiveRecord::Base
  has_many :votes, as: :voteable
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :answers
  has_many :responses, as: :respondable
  belongs_to :author, class_name: "User"

  def sort(sort_by)
    case sort_by
    when "oldest" then oldest_responses
    when "active" then active_responses
    when "votes" then popular_responses
    end
  end

  def active_responses
    self.answers.sort do |answer1, answer2|
      last1 = answer1.responses.last
      response_date1 = last1 ? last1.created_at : DateTime.new(2000,1,1)
      last2 = answer2.responses.last
      response_date2 = last2 ? last2.created_at : DateTime.new(2000,1,1)

      response_date2 <=> response_date1
    end
  end

  def oldest_responses
    self.answers.sort{ |x,y| x.created_at <=> y.created_at }
  end

  def popular_responses
    self.answers.sort{ |x,y| y.votes.count <=> x.votes.count }
  end


end
