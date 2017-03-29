class Day < ApplicationRecord
  has_many :pitches
  has_many :rounds
  has_many :votes, through: :rounds
  
  validates :cohort_name, :pic_url, :round_status, :date, :passing_number, :teams_total, presence: true
end
