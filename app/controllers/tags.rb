get '/tags/:id' do 
	@page_title = "Quora Clone: Homepage"
	@tag = Tag.find_by(id: params[:id])

	@list = []
	Question.all.each {|question| @list << question if question.tags.include?(@tag)}
	@list_title = "Questions for Category: #{@tag.name}"
	erb :"questions/all"
end