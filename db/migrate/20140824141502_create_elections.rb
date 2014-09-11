class CreateElections < ActiveRecord::Migration
  def change
    create_table :elections do |t|
      t.string :name, null: false
      t.integer :max_allowed_vote_per_user

      t.timestamps
    end
    add_column :episodes, :election_id, :integer
  end
end
