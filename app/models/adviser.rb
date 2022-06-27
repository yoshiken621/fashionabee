class Adviser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  has_many :rooms
  has_one_attached :image
  has_many :tops_items, through: :item_selects
  has_many :item_selects
end
