class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_day(day_id)
    Day.find_by(id: day_id)
  end
end
