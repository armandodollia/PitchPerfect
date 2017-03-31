class DaysController < ApplicationController
	def new
		redirect_to days_path unless admin?
	end
  def index
    @days = Day.all
  end

  def show
    @pitch = Pitch.new()
    @day = Day.find_by(id: params[:id])
    @pitches = Pitch.all.where(day_id: @day.id)
  end

  def create
  	redirect_to days_path unless admin?
  	
  	day = Day.new(days_params)
  	if day.save
  		redirect_to days_path
  	else
  		@errors = day.errors.full_messages
  		render new_day_path
  	end
  end

  def update
  	day = Day.find_by(id: params[:id])
  
  	day.round_status = advance_to_next_round(day)
  	day.save

  	redirect_to days_path
  end

  private
	def days_params
		params.require(:day).permit(:cohort_name, :pic_url, :round_status, :date, :passing_number, :teams_total)
	end

end

