class Pitch < ApplicationRecord
  # include PitchesHelper
  has_many :team_members, foreign_key: :team_id, class_name: 'User'
  has_many :votes
  belongs_to :author, class_name: 'User'
  belongs_to :day

  validates :title, :blurb, :tech_stack, :author_id, :day_id, presence: true

  def points_total
    self.votes.inject(0) {|sum, vote| sum += vote.points}
  end

  def sort_by_points_total
    points_hash = Hash.new
    self.each_with_index { |pitch, index| points_hash[index] = pitch.points_total }
    sorted_hash = Hash[points_hash.sort_by { |id, points| points }.reverse]
  end

  def self.round_1_winners(day)
    pitches = Pitch.all
    sorted_pitches = pitches.sort_by_points_total
    winners = Hash[sorted_pitches.sort_by {|id, points| -points}[0...(day.passing_number)]]
  end
end
