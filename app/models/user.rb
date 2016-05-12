class User < ActiveRecord::Base
  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :theOneWhoAnswers_id
  has_many :responses
  has_many :votes, foreign_key: :voter_id

  validate :validate_password

  def password=(plaintext_password)
    @plaintext_password = plaintext_password
    @hashed_password = BCrypt::Password.create(plaintext_password)
    self.hashword = @hashed_password
  end

  def password
    @hashed_password ||= BCrypt::Password.new(hashed_password)
  end

  def authenticate(plaintext_password)
    password == plaintext_password
  end

  def validate_password
    errors.add(:password, 'too short') if @plaintext_password.length < 6
  end
end
