class CreatePitches < ActiveRecord::Migration[5.0]
  def change
    create_table :pitches do |t|
      t.string :title, null: false
      t.string :blurb, null: false
      t.string :tech_stack, null: false
      t.integer :author_id, null: false
      t.integer :day_id, null: false

      t.timestamps null: false
    end
  end
end
