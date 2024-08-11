class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :seat_number, :price, presence: true
end
