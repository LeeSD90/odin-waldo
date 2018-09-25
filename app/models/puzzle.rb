class Puzzle < ApplicationRecord
  has_many :characters, dependent: :destroy
  has_many :scores, dependent: :destroy

  validates :title, presence: true
  validates :image, presence: true

  def check(char, x, y)
    character = (self.characters.select{|c| c.name.downcase == char.downcase }).first

    if character.nil? then return false end

    if(x.to_i.between?(character.x.to_i - 15, character.x.to_i + 15) &&
       y.to_i.between?(character.y.to_i - 15, character.y.to_i + 15))
      return true
    else return false
    end
  end
end
