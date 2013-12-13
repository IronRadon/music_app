module SessionsHelper
	def current_user
		User.where(:session_token => session[:session_token]).first
	end

	def logged_in?
		!current_user.nil?
	end
end