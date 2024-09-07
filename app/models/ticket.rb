class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :seat_number, :price, presence: true
  validates :seat_number, uniqueness: { scope: :event_id, message: "This seat has already been taken"}
end
