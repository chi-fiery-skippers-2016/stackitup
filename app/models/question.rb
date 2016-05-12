class Question < ActiveRecord::Base
  has_many :votes, as: :voteable
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :answers
  has_many :responses, as: :respondable
  belongs_to :author, class_name: "User"

  def self.sort_questions(sort_by)
    case sort_by
    when 'recent' then recent_questions
    when 'highest_votes' then popular_questions
    when 'trending' then trending_questions
    end
  end

  def self.recent_questions
    self.all.sort{ |q1, q2| q2.created_at <=> q1.created_at }
  end

  def self.popular_questions
    self.all.sort{ |q1, q2| q2.votes.count <=> q1.votes.count }
  end

  def self.trending_questions
    self.all.sort do |question1, question2|
      last1 = question1.answers.last
      response_date1 = last1 ? last1.created_at : DateTime.new(2000,1,1)
      last2 = question2.answers.last
      response_date2 = last2 ? last2.created_at : DateTime.new(2000,1,1)

      response_date2 <=> response_date1
    end
  end

  def sort_answers(sort_by)
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
    self.answers.sort{ |answer1, answer2| answer1.created_at <=> answer2.created_at }
  end

  def popular_responses
    self.answers.sort{ |answer1, answer2| answer2.votes.count <=> answer1.votes.count }
  end

  def tag_names=(string_list)
    string_list.strip!
    string_list_array = string_list.split(',')
    tag_group = []

    string_list_array.each do |tag_name|
    if Tag.where(name: tag_name) == []
      new_tag = Tag.new(name: tag_name)
      new_tag.save
      tag_group << new_tag
    else
      tag_group << Tag.find_by(name: tag_name)
    end
  end
    self.tags = tag_group
  end

end
