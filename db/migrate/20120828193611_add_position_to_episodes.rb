class AddPositionToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :position, :integer, default: 0
  end
end
