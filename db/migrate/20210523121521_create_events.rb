class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :user,              null: false
      t.string :title,              null: false
      t.string :location,              null: false
      t.text :description,              null: false
      t.date :date,              null: false
      t.integer :attend_limit,              null: false
      t.timestamps
    end
  end
end
