class RepliesController < ApplicationController
	def new
		authenticate_user!
		@post = Posts.find_by_id(params[:post_id])
	end

	def create
    raise "Error: user not signed in" if !user_signed_in?
    @reply = Replies.create!(post_params.merge(
      user: current_user,
      post_id: params[:post_id]))
    flash[:notice] = "Reply added!"
    redirect_to post_path(params[:post_id])
	end


  private

    def post_params
      params.require(:reply).permit(:content)
    end

end