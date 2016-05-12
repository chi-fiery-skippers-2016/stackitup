class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :responses, as: :respondable
  has_many :votes


  # validate :validate_password

  def password=(plaintext_password)
    @plaintext_password = plaintext_password
    @hashword_obj = BCrypt::Password.create(plaintext_password)
    self.hashword = @hashword_obj
  end

  def password
    @hashword_obj ||= BCrypt::Password.new(self.hashword)
  end

  def authenticate(plaintext_password)
    self.password == plaintext_password
  end

  def validate_password
    self.errors.add(:password, 'You password should contain more than 6 characters. Dummy.') if @plaintext_password.length < 6
  end

end
