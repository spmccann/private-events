class AttendedEvent < ApplicationRecord
  belongs_to :event
  belongs_to :user, foreign_key: 'attendee_id', class_name: 'User'

  validates :attendee_id, uniqueness: { scope: :event_id,
                                        message: 'You can only attend an event once.' }
end
