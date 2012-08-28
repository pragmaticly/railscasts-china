class AddPositionToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :position, :integer
  end
end
