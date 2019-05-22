class Image < ApplicationRecord
  belongs_to :item, optional: true
  mount_uploaders :images, ImageUploader

end
