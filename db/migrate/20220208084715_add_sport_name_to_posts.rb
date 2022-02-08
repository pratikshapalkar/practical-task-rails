class AddSportNameToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :sport_name, :string
    add_index :posts, :sport_name
  end
end
