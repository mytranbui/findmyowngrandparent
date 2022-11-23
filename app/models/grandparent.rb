class Grandparent < ApplicationRecord
  # one-to-many
  belongs_to :user
  # many-to-many
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings, dependent: :destroy

  validates :name, :age, :description, presence: true
end
