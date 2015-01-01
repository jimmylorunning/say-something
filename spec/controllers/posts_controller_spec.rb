  	# if not logged in, throw exception
  	# get params
  	# create new post instance with: params & current user
  	# if success: redirect with success flash message
    # if fail: redirect to ???  with failed flash message

    # also: do i have to worry about strong params? sanitizing title and content?

require 'rails_helper'

def sign_in(user = double('user'))
  if user.nil?
    allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
    allow(controller).to receive(:current_user).and_return(nil)
  else
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
  end
end

RSpec.describe PostsController, :type => :controller do

  describe "create action" do
  	context "not logged in" do
	    it "should throw exception if not logged in" do
	    	# set up - stub out user's authenticate method
				sign_in nil

	    	# do stuff - call create action
	    	# assert stuff - raise the correct error
				expect{post :create}.to raise_exception("Error: user not signed in")
	    end
	  end

	  context "logged in" do

	  	before(:each) do
	  		@user = double('user')
	  		sign_in @user
	    	@myparams = {title: 'title', content: 'content'}
	  	end

	    it "should call model with correct params" do
	    	# set up - set up new post return value
	    	new_post = double('post')

	    	# assert - that model was called with correct params and user
	    	Posts.should_receive(:create!).with(hash_including(:user => @user)).and_return(new_post)

	    	# do stuff - call create action with params
	    	post :create, {:post => @myparams}
	    end

	    it "should redirect afterwards" do
	    	# set up - stub everything
	    	new_post = double('post')
	    	Posts.stub(:create!).and_return(new_post)

	    	# do
	    	post :create, {:post => @myparams}

	    	# assert redirect to root with flash message
	    	flash.should_not be_nil
	    	response.should redirect_to post_path(new_post)
	    end

	  end
  end

end