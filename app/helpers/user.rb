helpers do
	# return current user if they exist
	def current_user
		if session[:user_id]
			@current_user = User.find_by_id(session[:user_id])
		end
	end
	