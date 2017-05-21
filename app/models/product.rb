class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  scope :recent, -> { order("created_at DESC") }
  belongs_to :category
end
