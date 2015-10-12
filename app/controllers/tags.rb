get '/tags/:id' do 
	@page_title = "Quora Clone: Homepage"
	@tag = Tag.find_by(id: params[:id])

	@list = Question.joins(:categories, :tags).where(categories: {tag_id: @tag.id}).paginate(:page => params[:page], :per_page => 3)
	@list_title = "Questions for Category: #{@tag.name}"

	erb :"questions/all"
end