post '/answervotes/upvote' do 
	@input = add_user_id(params[:answervote])
	@answer = Answer.find_by(id: @input["answer_id"])
	AnswerVote.create!(@input)
	redirect to("/questions/#{@answer.question_id}")
end

post '/answervotes/downvote' do 
	@input = add_user_id(params[:answervote])
	@answer = Answer.find_by(id: @input["answer_id"])
	AnswerVote.create!(@input)
	redirect to("/questions/#{@answer.question_id}")
end