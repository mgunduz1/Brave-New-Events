# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :user
      t.string :title
      t.string :location
      t.text :description
      t.date :date
      t.integer :attend_limit
      t.timestamps
    end
  end
end
