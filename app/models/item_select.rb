class ItemSelect < ApplicationRecord
  has_many :tops_items
  has_many :advisers

  validates :tops_item_id, presence: true
  validates :user_id, presence: true
end
