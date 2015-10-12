# show all answers
#get '/answers' do 
#end

# show specific answer
#get '/answers/:id' do 
#end

# create new answer
post '/answers' do 
	if logged_in?
		@input = add_user_id(params[:answer])
		@answer = Answer.new(@input)
		if @answer.save
			redirect to("questions/#{@input["question_id"]}")
		else 
			# placeholder for jquery error response
			@error="You can only post 1 answer for a question. Please edit your previous answer instead"
			redirect to("/")
		end
	else
		halt 401
	end
end

# change existing answer info
#puts '/answers/:id' do 
#end

# delete answer records from database
#delete '/answers/:id' do 
#end

get '/users/:id/answers' do
	@user = User.find_by(id: params[:id])
	@answers_list = Answer.where(user_id: @user.id).order(updated_at: :desc).flatten
	puts "[LOG] #{@answers_list.inspect}"
	erb :"answers/myanswers", :layout => false
end

