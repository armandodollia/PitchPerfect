module UsersHelper
  # def voted?(user, pitches, round_number)
  #   pitches.each do |pitch|
  #     pitch.votes.each do |vote|
  #       if vote.voter_id == user.id && vote.round.round_number == round_number
  #         return true
  #       end
  #     end
  #   end
  #   false
  # end

  def voted?(day, round_number)
    day.rounds.find_by(round_number: round_number).votes.each do |vote|
      if vote.voter_id == current_user
        return true
      end
      false
    end
  end

end

# def voted?(day)
#   day.rounds.find(round_number).votes.each do |vote|
#     if vote.voter_id == current_user
#       return true
#     end
#     false
#   end
# end
