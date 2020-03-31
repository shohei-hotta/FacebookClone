class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates :description, presence: true, length: { maximum: 100 } 
end
