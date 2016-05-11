class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true

  before_save :add_score

  def add_score
    if self.up?
      self.question.score += 1
    else
      self.question.score -= 1
    end
  end
end
