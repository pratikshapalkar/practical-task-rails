class AddSportId < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :sport, index: true, foreign_key: true
  end
end
