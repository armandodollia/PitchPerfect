class VotesController < ApplicationController
  def create
    # p "-------------------------------------"
    # p params
    params[:vote] = Hash.new
    params[:vote][:voter_id] = current_user.id
    params[:vote][:day_id] = params[:day_id]
    day = Day.find_by(id: params[:day_id])
    pitch_count = day.pitches.count
    # p params
    params.each do |key, value|
      # p "------------------------------"
      # p key
      # p key.class
      # p key.to_s.to_i
      # p "------------------------------"
      if key.to_s.to_i > 0
        # p key.class
        params[:vote][:pitch_id] = key
        params[:vote][:points] = pitch_count - value.to_s.to_i
        p vote_params
        # Vote.create!(vote_params)
      end
    end
  end

  private
    def vote_params
      params.require(:vote).permit(:pitch_id, :voter_id, :day_id, :points)
    end
end
