class PostsController < ApplicationController
  def index
  end

  def show
    @post = Posts.find_by_id(params[:id])
  end

  def edit
    authenticate_user!
  end

  def new
    authenticate_user!
  end

  def create
    raise "Error: user not signed in" if !user_signed_in?
    @post = Posts.create!(post_params.merge(user: current_user))
    flash[:notice] = "Post added!"
    redirect_to post_path(@post)
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
