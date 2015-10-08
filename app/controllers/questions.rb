# show all questions
get '/questions' do
	erb :"questions/index", :layout => :"questions/layout.html"
end

# page for submitting new question
get '/questions/new' do
	erb :"questions/new", :layout => :"questions/layout.html"
end

# show specific questions
get '/questions/:id' do
end

# create new questions
post '/questions' do 
end

# change existing questions info
puts '/questions/:id' do 
end

# delete questions records from database
delete '/questions/:id' do 
end