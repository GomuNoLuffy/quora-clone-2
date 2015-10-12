# show all users
#get '/users' do 
#end
# put create user route before users/id roud
get '/users/new' do
	@page_title = "Quora Clone: Registration"
 	erb :"users/new"
end

# show specific user
get '/users/:id' do 
	@page_title = "Quora Clone: User Profile"
 	erb :"users/profile"
end

# create new user
post '/users' do 
	@user = User.new(params[:user])
	if @user.save
		session[:user_id] = @user.id
		redirect to('/')
	else
		@error = @user.errors.full_messages[0]
		erb :"users/new"
	end
end

# change existing user info
#puts '/users/:id' do 
#end

# delete user records from database
#delete '/users/:id' do 
#end

