class RenameColumnPlayer < ActiveRecord::Migration[5.2]
  def change
    rename_column :players, :player_name, :name
  end
end
