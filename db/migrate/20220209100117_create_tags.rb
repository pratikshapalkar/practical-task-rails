class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.references :tagable, polymorphic: true
      t.text :content

      t.timestamps
    end
  end
end
