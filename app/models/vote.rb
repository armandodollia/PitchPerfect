class Vote < ApplicationRecord
  belongs_to :voter, class_name: 'User'
  belongs_to :pitch
  belongs_to :round
  
  validates :voter_id, :pitch_id, :round_id, :points, presence: true
end
