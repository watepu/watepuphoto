class Picture < ApplicationRecord
  validates :title, presence: true
  validates :image, presence: true
  mount_uploader :image, ImageUploader
end