class Grandparent < ApplicationRecord
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # one-to-many
  belongs_to :user
  # many-to-many
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings, dependent: :destroy

  validates :name, :age, :description, :photo, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 65, only_integer: true }
end
