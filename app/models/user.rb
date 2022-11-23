class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # one-to-many
  has_many :grandparents, dependent: :destroy
  # many-to-many
  has_many :bookings, dependent: :destroy
  has_many :grandparents, through: :bookings, dependent: :destroy
end
