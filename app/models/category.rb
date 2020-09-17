class Category < ApplicationRecord
  has_many :communities, through: :community_categories
end
