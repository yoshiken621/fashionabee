class Room < ApplicationRecord
  belongs_to :user
  belongs_to :adviser
  has_many :messages, dependent: :destroy
end
