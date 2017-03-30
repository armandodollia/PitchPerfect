class DaysController < ApplicationController
	def new
	end
  def index
    @days = Day.all
  end

  def show
    @day = Day.find_by(id: params[:id])
    @pitches = Pitch.all.where(day_id: @day.id)
  end

  def create
  end

end

