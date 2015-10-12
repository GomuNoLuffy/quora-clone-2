class Tag < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :categories
	has_many :questions, through: :categories
end
