class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :instaclone_content_id

      t.timestamps
    end
    
    add_index :favorites, [:user_id, :instaclone_content_id], :unique => true, :name => 'favorite_uniq_index'
  end
end
