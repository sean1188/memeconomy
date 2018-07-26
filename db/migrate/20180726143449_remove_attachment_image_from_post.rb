class RemoveAttachmentImageFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :image, :attachment
  end
end
