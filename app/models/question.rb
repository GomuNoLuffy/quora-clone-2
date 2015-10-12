class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	has_many :answers
	has_many :question_votes
	validates :title, length: { maximum: 255 }
	has_many :tags through :questions_tags
end
