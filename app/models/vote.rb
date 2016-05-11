class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true

  # before_save :add_score

 # change Q/A score upon vote
  # def add_score
  #   if self.up?
  #     self.voteable.score += 1
  #   else
  #     self.voteable.score -= 1
  #   end
  # end
end
