class Item < ApplicationRecord
  has_many :likes
  has_many :users, through: :likes
  has_many :images
  has_many :categories
end
