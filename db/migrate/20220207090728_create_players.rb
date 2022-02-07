class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :city
      t.string :state
      t.string :country
      t.bigint :phone
      t.string :gender

      t.timestamps
    end
  end
end
