class AddUserVote < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :episode_id, null: false

      t.timestamps
    end
    add_column :episodes, :votes_count, :integer, default: 0
  end
end
