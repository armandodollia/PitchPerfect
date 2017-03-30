class DaysController < ApplicationController

  def index
    @days = Day.all
  end

  def show
    @pitches = Pitch.all.where(day_id: params[:id])
  end

end

