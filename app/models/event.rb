class Event < ApplicationRecord
  belongs_to :user, foreign_key: 'creator_id', class_name: 'User'
  belongs_to :attended_events
end
