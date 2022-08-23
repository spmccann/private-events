class Event < ApplicationRecord
  belongs_to :user, foreign_key: 'creator_id', class_name: 'User'
  has_many :attended_events

  scope :upcoming_events, -> { where('date >= ?', Date.today) }
  scope :past_events, -> { where('date < ?', Date.today) }
end
