# show all users
#get '/users' do 
#end
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
end

# put create user route before users/id roud
get '/users/new' do
 	erb :"users/new", :layout => :"users/layout.html"
end

# show specific user
get '/users/:id' do 

 	erb :"users/profile", :layout => :"users/layout.html"
end

# create new user
post '/users' do 
	@user = User.new(params[:user])
	if @user.save
		redirect to('/')
	else
		session[:error] = "Email has already been used"
		redirect to('/users/new')
	end
end

# change existing user info
puts '/users/:id' do 
end

# delete user records from database
delete '/users/:id' do 
end

