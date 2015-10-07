# show all users
#get '/users' do 
#end
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
	session[:error] = nil
	@user = User.new(params[:user])
	if @user.save
		redirect to('/')
	else
		session[:error] = @user.errors.full_messages[0]
		redirect to('/users/new')
	end
end

# change existing user info
puts '/users/:id' do 
end

# delete user records from database
delete '/users/:id' do 
end

