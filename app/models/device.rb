class Device < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :name, presence: true
  validates :category, presence: true
  validates :address, presence: true
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
