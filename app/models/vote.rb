class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :voter, class_name: "User"

  alias :question :voteable

  before_save :add_score

  # change Q/A score upon vote
  def add_score
    if self.up?
      self.voteable.score += 1
      self.voteable.save
    else
      self.voteable.score -= 1
      self.voteable.save
    end
  end

  def double_voting?(current_user_id)
    if self.voteable.class == Question
      question = Question.find(self.voteable.id)
      puts question
      votes = question.votes.where(voter_id: current_user_id)
      puts votes
    elsif self.voteable.class == Answer
      answer = Answer.find(self.voteable.id)
      votes = answer.votes.where(voter_id: current_user_id)
    end
    votes.count == 0 ? false : true
  end
end
