class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  attr_accessible :email, :username, :password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: EMAIL_REGEX }

  validates :username, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { minimum: 3, maximum: 25 }

  before_save { self.email = email.downcase }
  has_secure_password
end