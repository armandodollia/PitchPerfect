class DaysController < ApplicationController

  def index
    @days = Day.all
  end

  def show
    @day = Day.find_by(id: params[:id])
    @pitches = Pitch.all.where(day_id: @day.id)
  end

end

