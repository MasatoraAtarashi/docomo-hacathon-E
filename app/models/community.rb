class Community < ApplicationRecord
  has_many :community_categories
  has_many :categories, through: :community_categories
end
