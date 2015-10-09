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
	@answers_list = Answer.where(question_id: params[:id]).order(updated_at: :desc)
	@page_title = "Quora Clone: #{@question.title}"
	erb :"questions/view"
end

# create new questions
post '/questions' do
	@input = add_user_id(params[:question])
	byebug
	@question = Question.new(@input)
	if @question.save
		redirect to('/')
	else
		@error = @question.errors.full_messages[0]
		erb :"questions/new"
	end
end

# change existing questions info
#puts '/questions/:id' do 
#end

# delete questions records from database
#delete '/questions/:id' do 
#end

get '/users/:id/questions' do
	@user = User.find_by(id: params[:id])
	@questions_list = Question.where(user_id: @user.id).order(updated_at: :desc)
	@page_title = "Quora Clone: My Questions"
	return erb :"questions/myquestions", :layout => false 
end