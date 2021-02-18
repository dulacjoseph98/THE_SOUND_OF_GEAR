class Device < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :name, presence: true
  validates :category, presence: true
  validates :address, presence: true
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :address, :category ],
    associated_against: {
      user: [ :name ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
