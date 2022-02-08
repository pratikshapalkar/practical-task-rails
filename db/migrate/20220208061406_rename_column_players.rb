class RenameColumnPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :name_of_player, :string
    add_index :posts, :name_of_player
  end
end
