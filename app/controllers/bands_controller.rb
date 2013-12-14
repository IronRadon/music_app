class BandsController < ApplicationController

	def index
		@bands = Band.order(:name)

		render :index
	end

	def show
		@band = Band.find(params[:id])

		render :show
	end

	def new
		render :new
	end

	def create
		@band = Band.new(params[:band])

		if @band.save
			flash[:messages] = ["This is a newly added band!"]
			redirect_to(band_url(@band))
		else
			flash.now[:errors] = @band.errors.full_messages
			render :new
		end
	end

	def destroy
		@band = Band.find(params[:id])
		Band.delete(params[:id])
		flash[:messages] = ["You just deleted #{@band.name}."]
		redirect_to(bands_url)
	end

	def edit
		@band = Band.find(params[:id])
		
		render :edit

	end
end