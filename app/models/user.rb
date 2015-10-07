class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :questions
	has_many :answers
    validates :email, uniqueness: true

  def self.authenticate(email, password)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
    @user = (User.find_by(email: email)
    if (@user != nil)
    	return @user.id if @user.password == password
    	return "password_invalid" if @user.password != password
    else
    	return "username_invalid"
    end
  end
end
