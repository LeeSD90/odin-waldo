class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :x
      t.integer :y
      t.references  :puzzle

      t.timestamps
    end
  end
end
