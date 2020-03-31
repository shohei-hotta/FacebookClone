class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :description, presence: true, length: { maximum: 100 } 
end
