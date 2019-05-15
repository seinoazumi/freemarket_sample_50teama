class UserItem < ApplicationRecord
  belomgs_to :user
  belongs_to :item
end
