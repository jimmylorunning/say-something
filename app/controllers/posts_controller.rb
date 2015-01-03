class PostsController < ApplicationController
  def index
    @posts = Posts.order(created_at: :desc)
  end

  def show
    @post = Posts.find_by_id(params[:id])
    @replies = Replies.where(post: @post).order(created_at: :asc)
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

  def destroy
    post = Posts.find_by_id(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end

end
