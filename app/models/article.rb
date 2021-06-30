class Article < ActiveRecord::Base
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  attr_accessible :title, :desc, :user_id, :category_ids
  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :desc, presence: true, length: { minimum: 6, maximum: 5000 }
  validates :user_id, presence: true
end
