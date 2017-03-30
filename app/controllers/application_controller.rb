class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user, :admin?

  def current_day(day_id)
    Day.find_by(id: day_id)
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def admin?
    current_user.is_admin
  end

end
