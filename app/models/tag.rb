class Tag < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :questions through :questions_tags
end
