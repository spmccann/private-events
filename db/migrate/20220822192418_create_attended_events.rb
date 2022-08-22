class CreateAttendedEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :attended_events do |t|
      t.references :event, null: false, foreign_key: true
      t.integer :attendee_id

      t.timestamps
    end
  end
end
