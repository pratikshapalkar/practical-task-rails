class AddUserIdToPostAttachments < ActiveRecord::Migration[5.2]
  def change
    add_column :post_attachments, :user_id, :integer
    add_index :post_attachments, :user_id
  end
end
