class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	has_many :answers
	has_many :question_votes
	has_many :categories
	has_many :tags, through: :categories
	validates :title, length: { maximum: 255 }
end
