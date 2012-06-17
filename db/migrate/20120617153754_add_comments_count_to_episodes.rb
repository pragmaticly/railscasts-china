class AddCommentsCountToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :comments_count, :integer, default: 0
  end
end
