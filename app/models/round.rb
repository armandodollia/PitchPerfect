class Round < ApplicationRecord
  belongs_to :day
  has_many :votes
  
  validates :day_id, :round_number, presence: true
end
