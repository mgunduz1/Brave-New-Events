class CreateAttendee < ActiveRecord::Migration[6.1]
  def change
    create_table :attendees do |t|
      t.references :event
      t.references :user
      t.boolean :will_join, default: true
      t.timestamps
    end
  end
end
