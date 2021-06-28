class Article < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :desc, :user_id
  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :desc, presence: true, length: { minimum: 6, maximum: 300 }
  validates :user_id, presence: true
end