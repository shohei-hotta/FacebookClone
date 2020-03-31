class Feed < ApplicationRecord
  validates :description, presence: true, length: { maximum: 100 } 
end
