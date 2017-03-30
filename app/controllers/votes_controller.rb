class VotesController < ApplicationController
  def create
    params[:vote] = Hash.new
    day = Day.find_by(id: params[:day_id])
    if day.round_status == 'round_1'
      current_round = 1
    elsif day.round_status == 'round_2'
      current_round = 2
    end
    params[:vote][:voter_id] = current_user.id
    pitch_count = day.pitches.count
    params.each do |key, value|
      if key.to_s.to_i > 0
        params[:vote][:pitch_id] = key
        params[:vote][:points] = pitch_count - value.to_s.to_i
        day.rounds.find_by(round_number: current_round).votes.new(vote_params).save
      end
    end
  end

  private
    def vote_params
      params.require(:vote).permit(:pitch_id, :voter_id, :points)
    end
end
