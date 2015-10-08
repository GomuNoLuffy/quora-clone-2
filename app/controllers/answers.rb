# show all answers
#get '/answers' do 
#end

# show specific answer
#get '/answers/:id' do 
#end

# create new answer
post '/answers' do 
	@input = params[:answer]
	@input["user_id"] = current_user.id
	puts "[LOG] @input is #{@input.inspect}}"
	@answer = Answer.new(params[:answer])
	if @answer.save
		redirect to("questions/#{@input["question_id"]}")
	else 
		# placeholder for jquery error response
		@error="You can only post 1 answer for a question. Please edit your previous answer instead"
		redirect to("/")
	end
end

# change existing answer info
puts '/answers/:id' do 
end

# delete answer records from database
delete '/answers/:id' do 
end