class Grandparent < ApplicationRecord
  has_one_attached :photo
  # one-to-many
  belongs_to :user
  # many-to-many
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings, dependent: :destroy

  validates :name, :age, :description, :photo, presence: true
end
