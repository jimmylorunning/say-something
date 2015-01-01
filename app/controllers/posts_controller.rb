class PostsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
#    debugger
  	# if not logged in, throw exception
    raise "Error: user not signed in" if !user_signed_in?
  	# get params
  	# create new post instance with: params & current user
#    Posts.create!(params[:post].merge!(user_id: current_user))
#debugger
    Posts.create!(post_params.merge(user: current_user))

  	# if success: redirect with success flash message
    # if fail: redirect to ???  with failed flash message
    redirect_to root_path # for now

    # also: do i have to worry about strong params? sanitizing title and content?
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
