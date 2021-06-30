class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :article_categories
  has_many :articles, through: :article_categories
  validates :name, presence: true, length: { maximum: 30, minimum: 3 }
  validates_uniqueness_of :name
end