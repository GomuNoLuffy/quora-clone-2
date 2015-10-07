get '/' do
	if logged_in?
  		redirect to("users/#{session[:user_id]}")
  	else
  		redirect to('/session/new')
  	end
end

get '/session/new' do
 	erb :"session/login", :layout => :"session/layout.html"
end

post '/session' do
	session[:error] = nil
	@login = User.authenticate(params[:user]["email"], params[:user]["password"])
	case @login
	when "username_invalid"
		session[:error]="Invalid username entered"
	when "password_invalid"
		session[:error]="Invalid password entered for username #{params[:user]["email"]}"
	else 
		session[:user_id] = @login
	end
	redirect to ('/')
end

delete '/session' do
	session[:user_id] = nil
	redirect to('/')
end

get '/session/reset' do
	session[:user_id] = nil
	session[:error] = nil
	redirect to('/')
end

