class UsersController < ApplicationController
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if params[:tag] != nil
      @user.tag = params[:tag]
      @user.save
    end

    if params[:name] != nil
      if User.where("name = ?", params[:name]).first == nil
        @user.name = params[:name]
        @user.save
      end

      respond_to do |format|
        format.html { render json: @user }
        format.json { render json: @user }
      end
    end
  end
end
