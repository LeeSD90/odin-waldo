class Character < ApplicationRecord
  belongs_to  :puzzle

  validates :name,  presence: true
  validates :x, presence: true
  validates :y, presence: true
end
