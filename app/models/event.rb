class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'
  has_many :tickets
  has_many :attendees, through: :tickets, source: :user

  validates :name, :location, :date, :organizer_id, presence: true
  validates :name, uniqueness: { scope: :date, message: "An Event with the same name already exists on this date"}
end
