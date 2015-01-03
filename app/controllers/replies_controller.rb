class RepliesController < ApplicationController
	def new
		authenticate_user!
		@post = Posts.find_by_id(params[:post_id])
	end

	def create
    raise "Error: user not signed in" if !user_signed_in?
# do I have to do this or will it be automatic?
#		@post = Posts.find_by_id(params.require(:reply).permit(:post_id))
    @reply = Replies.create!(post_params.merge(user: current_user))
    flash[:notice] = "Reply added!"
    redirect_to post_path(params[:reply][:post_id])
	end


  private

    def post_params
      params.require(:reply).permit(:content, :post_id)
    end

end