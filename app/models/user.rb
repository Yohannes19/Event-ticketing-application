class User < ApplicationRecord
  before_validation :set_default_role, on: :create

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  # Custom validations
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, on: :create

  enum role: {attendee: 0, organizer:1, admin: 2}

  has_many :organized_events, class_name: 'Event',foreign_key: 'organizer_id'
  has_many :tickets       
  has_many :attended_events, through: :tickets, source: :event

  validates :role, presence: true, inclusion: { in: %w(admin organizer attendee) }

  private
  
  def set_default_role
    self.role ||= 'attendee'
  end
end
