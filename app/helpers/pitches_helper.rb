module PitchesHelper
  def sort_by_points_total(pitches)
    points_hash = Hash.new
    pitches.each_with_index { |pitch, index| points_hash[index] = pitch.points_total }
    sorted_hash = Hash[points_hash.sort_by { |id, points| points }.reverse]
  end

  def round_1_winners(pitches, day)
    sorted_pitches = sort_by_points_total(pitches)
    winner_num = Hash[sorted_pitches.sort_by {|id, points| -points}[0...(day.passing_number)]]
    winner_num.map {|id| Pitch.find_by(id: id)}
  end

  def round_2_winners(pitches, day)
    sorted_pitches = sort_by_points_total(pitches)
    winner_num = Hash[sorted_pitches.sort_by {|id, points| -points}[0...(day.teams_total)]]
    winner_num.map {|id| Pitch.find_by(id: id)}
  end
end
