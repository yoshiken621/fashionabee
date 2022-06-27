class TopsItem < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  validates :images, presence: true
  has_many :advisers, through: :item_selects
  has_many :item_selects
end
