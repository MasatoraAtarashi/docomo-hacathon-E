class Community < ApplicationRecord
  has_many :community_categories
  has_many :categories, through: :community_categories

  validates :name, presence: true
  validates :url, presence: true
  validates :picture, presence: true
end
