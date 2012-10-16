class AddVideoUrlAndDownloadUrlToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :video_url, :string
    add_column :episodes, :download_url, :string
  end
end
