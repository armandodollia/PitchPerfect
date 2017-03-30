class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to '/days#index'
    else
      @errors = ["Invalid email/password combination"]
      render '/users/new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to "/users/new"
  end

end
