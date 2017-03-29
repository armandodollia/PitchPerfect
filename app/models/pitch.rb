class Pitch < ApplicationRecord
  has_many :team_members, foreign_key: :team_id, class_name: 'User'
  has_many :votes
  belongs_to :author, class_name: 'User'
  belongs_to :day
  
  validates :title, :blurb, :tech_stack, :author_id, :day_id, presence: true
end
