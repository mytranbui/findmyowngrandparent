class Booking < ApplicationRecord
  # many-to-many
  belongs_to :user
  belongs_to :grandparent

  validates :start_date, :end_date, presence: true
  validates :grandparent, uniqueness: { scope: :user }
end
