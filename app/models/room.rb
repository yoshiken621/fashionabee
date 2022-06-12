class Room < ApplicationRecord
  has_one :user
  has_one :adviser
  has_many :messages, dependent: :destroy
end
