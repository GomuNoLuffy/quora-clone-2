# show all questions
get '/questions' do
	@page_title = "Quora Clone: Homepage"
	@list = Question.all.order(updated_at: :desc).limit(10)
	erb :"questions/all"
end

# page for submitting new question
get '/questions/new' do
	@page_title = "Submit Your question"
	erb :"questions/new"
end

# show specific question
get '/questions/:id' do
	@question = Question.find_by(id: params[:id])
	@page_title = "Quora Clone: #{@question.title}"
	erb :"questions/view"
end

# create new questions
post '/questions' do
	@input = params[:question]
	@input["user_id"] = current_user.id
	@question = Question.new(@input)
	if @question.save
		redirect to('/')
	else
		@error = @question.errors.full_messages[0]
		erb :"questions/new"
	end
end

# change existing questions info
puts '/questions/:id' do 
end

# delete questions records from database
delete '/questions/:id' do 
end