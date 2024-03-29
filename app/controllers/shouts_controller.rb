class ShoutsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!, :only => [:create, :destroy]

  # GET /shouts
  # GET /shouts.json
  def index
    @shouts = Shout.all

    if params[:tag] != nil
      @shouts = Shout.where("tag = ?", params[:tag])
    end

    if params[:date] != nil
      date = params[:date]
      date = date.sub("T", " ")
      date = date.sub("Z", "")
      @shouts = Shout.where("created_at > ?", date)
    end

    # return information about which shouts user has rated
    if params[:userid] != nil
      @shouts = Rating.where("user_id = ?", params[:userid])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shouts }
    end
  end

  # GET /shouts/1
  # GET /shouts/1.json
  def show
    @shout = Shout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shout }
    end
  end

  # GET /shouts/new
  # GET /shouts/new.json
  def new
    @shout = Shout.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shout }
    end
  end

  # GET /shouts/1/edit
  def edit
    @shout = Shout.find(params[:id])
  end

  # POST /shouts
  # POST /shouts.json
  def create
    @shout = Shout.new(params[:shout])

    respond_to do |format|
      if @shout.save
        format.html { redirect_to @shout, notice: 'Shout was successfully created.' }
        format.json { render json: @shout, status: :created, location: @shout }
      else
        format.html { render action: "new" }
        format.json { render json: @shout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shouts/1
  # PUT /shouts/1.json
  def update
    @shout = Shout.find(params[:id])
    vote = 0

    if params[:vote] == "add"
      vote = 1
      @shout.rating += 1
      @shout.save
    elsif params[:vote] == "sub"
      vote = -1
      @shout.rating -= 1
      @shout.save
    end

    record = Rating.where("user_id = ? AND shout_id = ?", params[:userid], params[:id]).first
    if record == nil
      Rating.create :shout_id => params[:id], :user_id => params[:userid], :vote => vote
    else
      if (record.vote == -1 && params[:vote] == "add") || (record.vote == 1 && params[:vote] == "sub")
        record.vote = 0
      else
        record.vote = vote
      end
      record.save
    end

    respond_to do |format|
      if @shout.update_attributes(params[:shout])
        format.html { redirect_to @shout, notice: 'Shout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shouts/1
  # DELETE /shouts/1.json
  def destroy
    @shout = Shout.find(params[:id])
    @shout.destroy

    respond_to do |format|
      format.html { redirect_to shouts_url }
      format.json { head :no_content }
    end
  end
end
