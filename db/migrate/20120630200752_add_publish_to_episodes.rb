class AddPublishToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :publish, :boolean
  end
end
