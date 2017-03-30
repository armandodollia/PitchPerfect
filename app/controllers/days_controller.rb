class DaysController < ApplicationController

  def index
    @days = Day.all
  end

  def show
    @pitches = current_day(params[:id]).try(:pitches)
  end

end

