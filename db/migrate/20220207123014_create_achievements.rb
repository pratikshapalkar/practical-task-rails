class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.string :award
      t.integer :gold_medal
      t.integer :silver_medal
      t.integer :bronze_medal

      t.timestamps
    end
  end
end
