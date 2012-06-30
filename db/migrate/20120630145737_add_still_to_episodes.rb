class AddStillToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :still, :string
  end
end
