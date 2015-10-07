# show all users
get '/users' do 
end

# show specific user
get '/users/:id' do 
end

# check user authentication
post '/login' do
	@login = User.authenticate(params[:email], params[:password])
	case @login
	when username_invalid
	when password_invalid
	else 
		session[:userId] = @login
		redirect to ('/home')
	end
end

# create new user
post '/signup' do 
	@user = User.create!(params[:email], params[:password])
	@message = "Signed up. You may now login."
	redirect to('/home')
end

# change existing user info
puts '/users/:id' do 
end

# delete user records from database
delete '/users/:id' do 
end

