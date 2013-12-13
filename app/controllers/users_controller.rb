class UsersController < ApplicationController
	include UsersHelper

	def index
		@users = User.all

		render :index
	end

	def show
		@user = User.where(:id => params[:id]).first
	end

	def create
		@user = User.new(params[:user])
		if @user.save!
			flash[:message] = ["Signup Successful!"]
			login!
			redirect_to(user_url(@user))
		else
			flash[:errors] = @user.errors.full_messages
			render :new
		end
	end

	def new
		render :new
	end
end