class AddImageToPuzzles < ActiveRecord::Migration[5.2]
  def up
    add_attachment :puzzles, :image
  end

  def down
    remove_attachment :puzzles, :image
  end
end
