class PitchesController < ApplicationController
  
  def create
    params[:pitch][:author_id] = current_user.id
    params[:pitch][:day_id] = params[:day_id]
    # p pitches_params
    # p params
    # puts "* " * 30
    pitch = Pitch.new(pitches_params)
    
    if pitch.save
      # puts "* " * 30
      # p pitch
      redirect_to "/days/#{params[:day_id]}"
    else
      
      
    end
  end

  private
  def pitches_params
    params.require(:pitch).permit(:title, :blurb, :tech_stack, :day_id, :author_id)
  end
end

