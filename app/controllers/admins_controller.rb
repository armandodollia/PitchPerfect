class AdminsController < ApplicationController
  before_action :require_login, :require_admin
  
  
	def new
	end

	def create
		admin = User.new(user_params)
		admin.is_admin = true
		if admin.save
			redirect_to '/days#index'
		else
			@errors = admin.errors.full_messages
			render 'new'
		end
	end

	private
	def user_params
		params.require(:admin).permit(:first_name, :last_name, :email, :password)
	end
end