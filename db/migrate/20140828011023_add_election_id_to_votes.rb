class AddElectionIdToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :election_id, :integer
  end
end
