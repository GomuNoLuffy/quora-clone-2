get '/' do
  redirect to('/login')
end

get '/login' do
 	erb :"static/login", :layout => :"static/layout.html"
end


get '/signup' do
 	erb :"static/signup", :layout => :"static/layout.html"
end
