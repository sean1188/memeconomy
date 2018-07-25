class CreatePost < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :description
      t.references :user, foreign_key: true
      t.timestamp :created_at
    end
  end
end
