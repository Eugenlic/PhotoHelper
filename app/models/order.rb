class Order < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  enum status: %i[considered valuated in_work ready completed]
end
