class DaysController < ApplicationController
  def index
  end
  
  def show
    @pitches = current_day(params[:id]).try(:pitches)
  end
end