class Item < ApplicationRecord
  has_many :likes
  has_many :user_items
  has_many :users, through: :user_items
  has_many :images
  has_many :categories
end
