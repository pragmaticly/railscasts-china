class AddDownloadCommentsControlToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :allow_download, :boolean
    add_column :episodes, :allow_comment, :boolean
  end
end
