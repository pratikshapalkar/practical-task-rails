class Remove < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_attachments, :post_id
  end
end
