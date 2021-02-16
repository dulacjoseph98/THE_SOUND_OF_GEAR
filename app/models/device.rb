class Device < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :name, presence: true
  validates :category, presence: true
end
