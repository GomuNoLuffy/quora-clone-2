helpers do
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  # Returns true if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
  end

  def check_submitted?(answer_list)
  	users_submitted = []
  	answer_list.each { |x| users_submitted << x.user_id } 
  	return false if users_submitted.include?(current_user.id)
  	return true
  end
end