class CreateInstacloneContents < ActiveRecord::Migration[5.1]
  def change
    create_table :instaclone_contents do |t|
      t.text :title
      t.text :image
      t.text :content

      t.timestamps
    end
  end
end
