class AddPostIdToPostAttachments < ActiveRecord::Migration[5.2]
  def change
    add_column :post_attachments, :post_id, :integer
    add_index :post_attachments, :post_id
  end
end
