post '/answervotes/vote' do 
	if logged_in?
		@input = add_user_id(params[:answervote])
		@answer = Answer.find_by(id: @input["answer_id"])
		AnswerVote.create!(@input)
		redirect to("/questions/#{@answer.question_id}")
	else
		halt 401
	end
end
