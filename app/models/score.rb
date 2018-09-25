class Score < ApplicationRecord
  belongs_to :puzzle
  validates :name, presence: true
  validates :time, presence: true
end
