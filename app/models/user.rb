class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :devices
  has_many :devices, through: :reservations, as: :rented_devices
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
