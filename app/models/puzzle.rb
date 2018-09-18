class Puzzle < ApplicationRecord
  has_many :characters, dependent: :destroy

  validates :title, presence: true
  validates :image, presence: true
end
