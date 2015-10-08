class Answer < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :question
	belongs_to :user
	validates :user_id, :uniqueness => {:scope => :question_id} # one user can only answer once for a question
end
