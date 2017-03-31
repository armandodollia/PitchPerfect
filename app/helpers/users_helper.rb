module UsersHelper

  def voted?(day, round_number)
    p day.rounds.find_by(round_number: round_number).votes
    p session[:user_id]
    day.rounds.find_by(round_number: round_number).votes.each do |vote|
      if vote.voter_id == session[:user_id]
        return true
      end
    end
    return false
  end

end

