class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :image_url
      t.text :content
      t.text :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
