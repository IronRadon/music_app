module UsersHelper
	def login!(user)
		user.reset_session_token!
		session[:session_token] = user.session_token
	end
end