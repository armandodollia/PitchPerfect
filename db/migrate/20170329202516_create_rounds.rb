class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :round_number, null: false
      t.integer :day_id, null: false

      t.timestamps null: false
    end
  end
end
