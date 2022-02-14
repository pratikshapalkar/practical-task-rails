class RenameColumnSports < ActiveRecord::Migration[5.2]
  def change
    rename_column :sports, :sport_name, :name
  end
end
