class Category < ApplicationRecord
  has_many :community_categories
  has_many :communities, through: :community_categories
end
