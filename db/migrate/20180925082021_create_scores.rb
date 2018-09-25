class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.string :name
      t.time :time
      t.references  :puzzle

      t.timestamps
    end
  end
end
