class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :episode
      t.belongs_to :user
      t.text :content

      t.timestamps
    end
  end
end
