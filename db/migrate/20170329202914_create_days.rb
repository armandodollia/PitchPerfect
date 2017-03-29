class CreateDays < ActiveRecord::Migration[5.0]
  def change
    create_table :days do |t|
      t.string :cohort_name, null: false
      t.string :pic_url, null: false
      t.string :round_status, null: false
      t.datetime :date, null: false
      t.integer :passing_number, null: false
      t.integer :teams_total, null: false

      t.timestamps null: false
    end
  end
end
