class Tag < ActiveRecord::Base
  belongs_to :tagging
  has_many :questions, through: :tagging
end
