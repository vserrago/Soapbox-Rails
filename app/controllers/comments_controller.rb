class CommentsController < ApplicationController
  def create
    @shout = Shout.find(params[:shout_id])
    @comment = @shout.comments.create(params[:comment])
    redirect_to shout_path(@shout)
  end
end
