class AddCommentsCacheToEpisodes < ActiveRecord::Migration
  def change
    change_table(:episodes) do |t|
      t.integer :comments_count, default: 0
    end
  end
end
