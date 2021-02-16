class Device < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :name, presence: true
  validates :category, presence: true
  has_one_attached :photo
end
