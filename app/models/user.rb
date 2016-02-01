class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true,
    format: { with: /\A\S+@\S+\z/ },
    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 10, allow_blank: true }
  validates :username, presence: true,
    format: { with: /\A[A-Z0-9]+\z/i },
    uniqueness: { case_insentive: false }

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end

  def self.authenticate(email_username, password)
    user = User.find_by(email: email_username) || User.find_by(username: email_username)
    user && user.authenticate(password)
  end
end
