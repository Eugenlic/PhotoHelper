class Order < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  enum status: { considered: 0, valuated: 1, cancel: 2, in_work: 3, ready: 4, completed: 5 }
  validates :price, numericality: { greater_than_or_equal_to: 0.00 }, allow_nil: true

  scope :default_sort, -> { order(:created_at).reverse }
end
