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
end
