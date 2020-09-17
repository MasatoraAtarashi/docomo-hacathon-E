class Community < ApplicationRecord
  has_many :categories, through: :community_categories
end
