class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :voter_id, null: false
      t.integer :pitch_id, null: false
      t.integer :round_id, null: false
      t.integer :points, default: 0

      t.timestamps null: false
    end
  end
end
