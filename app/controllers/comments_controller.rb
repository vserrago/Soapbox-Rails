class CommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!, :only => [:create, :destroy]

  def create
    @shout = Shout.find(params[:shout_id])
    @comment = @shout.comments.create(params[:comment])
    redirect_to shout_path(@shout)
  end

  def index
    @shout = Shout.find(params[:shout_id])
    @comments = @shout.comments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

 def destroy
    @shout = Shout.find(params[:shout_id])
    @comment = @shout.comments.find(params[:id])
    @comment.destroy
    redirect_to shout_path(@shout)
  end

end
