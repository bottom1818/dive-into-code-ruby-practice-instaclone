class AddUserIdToInstacloneContents < ActiveRecord::Migration[5.1]
  def change
    add_column :instaclone_contents, :user_id, :integer
  end
end
