class Category < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true, length: { maximum: 30, minimum: 3 }
  validates_uniqueness_of :name
end