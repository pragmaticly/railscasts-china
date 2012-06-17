class AddUserIdToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :user_id, :integer
  end
end
