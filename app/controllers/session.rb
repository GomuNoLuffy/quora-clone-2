get '/' do
	if logged_in?
		redirect to('/questions')
  		#redirect to("users/#{session[:user_id]}")
  	else
  		redirect to('/session/new')
  	end
end

get '/session/new' do
	@page_title = "Quora Clone: Login"
 	erb :"session/login"
end

post '/session' do
	@login = User.authenticate(params[:user]["email"], params[:user]["password"])
	case @login
	when "username_invalid"
		@error ="Invalid username entered"
		erb :"session/login"
	when "password_invalid"
		@error ="Invalid password entered for username #{params[:user]["email"]}"
		erb :"session/login"
	else 
		session[:user_id] = @login
		redirect to ('/')
	end	
end

delete '/session' do
	session[:user_id] = nil
	redirect to('/')
end

get '/session/reset' do
	session[:user_id] = nil
	redirect to('/')
end

