class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :responses, as: :respondable

  validate :validate_password

  def password=(plaintext_password)
    @plaintext_password = plaintext_password
    @hashed_password = BCrypt::Password.create(plaintext_password)
    self.hashed_password = @hashed_password
  end

  def password
    @hashed_password ||= BCrypt::Password.new(hashed_password)
  end

  def authenticate(plaintext_password)
    password == plaintext_password
  end

  def validate_password
    errors.add(:password, 'too short') if @plaintext_password.length < 8
  end
end
