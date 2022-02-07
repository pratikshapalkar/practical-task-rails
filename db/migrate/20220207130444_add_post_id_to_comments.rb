class AddPostIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :post_title, :string
    add_index :comments, :post_title
  end
end
