class AttendedEvent < ApplicationRecord
  has_many :events
  has_many :users, through: :events, foreign_key: 'attendee_id', class_name: 'User'

  validates :attendee_id, uniqueness: { scope: :event_id,
                                        message: 'You can only attend an event once.' }
end
