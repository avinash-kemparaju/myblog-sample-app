class User < ActiveRecord::Base
  has_many :articles
  attr_accessible :email, :username, :password
  has_secure_password
end