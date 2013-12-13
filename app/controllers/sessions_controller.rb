class SessionsController < ApplicationController
	include SessionsHelper
	include UsersHelper

	def new
		render :new
	end

	def create
		@user = User.find_by_credentials(params[:user][:email], 
																		params[:user][:password])
		if @user
			login!(@user)
			flash[:messages] = ["WE MISSED YOU SO MUCH. @_@"]

			redirect_to(user_url(@user))
		else
			flash.now[:errors] = ["Invalid email/password combination."]
			render :new
		end
	end

	def destroy
		user = current_user
		user.reset_session_token!
		session[:session_token] = nil

		redirect_to(new_session_url)
	end
end