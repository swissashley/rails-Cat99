class User < ActiveRecord::Base
  validates :user_name, :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 8, allow_nil: true }

  after_initialize  :ensure_session_token

  attr_reader :password

  has_many :cats
  has_many :cat_rental_requests

  def reset_session_token!
      self.session_token = SecureRandom::urlsafe_base64(32)
      self.save
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    # self.password_digest == BCrypt::Password.new(password).to_s
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return nil unless user
    return user if user.is_password?(password)  #used user && BCrypt::Password.create(self.password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(32)
  end
end
