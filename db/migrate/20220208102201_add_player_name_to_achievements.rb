class AddPlayerNameToAchievements < ActiveRecord::Migration[5.2]
  def change
    add_column :achievements, :player_name, :string
    add_index :achievements, :player_name
  end
end
