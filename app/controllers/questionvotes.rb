post '/questionvotes/upvote' do 
	@input = add_user_id(params[:questionvote])
	@questionvote = QuestionVote.create!(@input)
	redirect to("/questions/#{@input["question_id"]}")
end

post '/questionvotes/downvote' do 
	@input = add_user_id(params[:questionvote])
	@questionvote = QuestionVote.create!(@input)
	redirect to("/questions/#{@input["question_id"]}")
end
