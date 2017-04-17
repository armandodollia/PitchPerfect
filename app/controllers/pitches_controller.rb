class PitchesController < ApplicationController
  before_action :require_login

  def create
    params[:pitch][:author_id] = current_user.id
    params[:pitch][:day_id] = params[:day_id]
    @pitch = Pitch.new(pitches_params)

    respond_to do |format|
      if @pitch.save
        format.html { redirect_to "/days/#{params[:day_id]}"  }
        format.js { render layout: false }
      else
        format.js { render layout: false }
      end
    end
  end

  private
  def pitches_params
    params.require(:pitch).permit(:title, :blurb, :tech_stack, :day_id, :author_id)
  end
end

