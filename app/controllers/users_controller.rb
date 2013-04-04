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
    @new_tag = params[:tag]
    @new_name = params[:name]

    if @new_tag != nil
      @user.tag = @new_tag
      @user.save
    end

    if @new_name != nil
      @user.name = @new_name
      @user.save
    end
  end
end
