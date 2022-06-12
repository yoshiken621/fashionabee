class Message < ApplicationRecord
  belongs_to :rooms
  belongs_to :users
  belongs_to :advisers
  has_many_attached :images

  validates :content, presence: true
end
