class AthletesController < ApplicationController
  # make sure user is signed in before they access
  before_filter :authenticate_user!, :except => [:index, :show] 

  # GET /athletes
  # GET /athletes.json
  def index
    unless params[:low] && params[:high]
      @athletes = Athlete.all
    else
      @athletes = Athlete.filter(params[:low], params[:high])
    end

    @graduation_year_range = Athlete.low_high_graduation_years
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @athletes }
    end
  end

  # GET /athletes/1
  # GET /athletes/1.json
  def show
    @athlete = Athlete.find(params[:id])
    @micropost = current_user.athlete.microposts.build
    @microposts = @athlete.microposts.paginate(page: params[:page])
    @feed_items = @athlete.feed.paginate(page: params[:page])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @athlete }
    end
  end

  # GET /athletes/new
  # GET /athletes/new.json
  def new
    @athlete = Athlete.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @athlete }
    end
  end

  # GET /athletes/1/edit
  def edit
    @athlete = Athlete.find(params[:id])
  end

  # POST /athletes
  # POST /athletes.json
  def create
    @athlete = Athlete.new(params[:athlete])
    @athlete.user_id = current_user.id

    respond_to do |format|
      if @athlete.save
        format.html { redirect_to @athlete, notice: 'Athlete was successfully created.' }
        format.json { render json: @athlete, status: :created, location: @athlete }
      else
        format.html { render action: "new" }
        format.json { render json: @athlete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /athletes/1
  # PUT /athletes/1.json
  def update
    @athlete = Athlete.find(params[:id])

    respond_to do |format|
      if @athlete.update_attributes(params[:athlete])
        format.html { redirect_to @athlete, notice: 'Athlete was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @athlete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /athletes/1
  # DELETE /athletes/1.json
  def destroy
    @athlete = Athlete.find(params[:id])
    @athlete.destroy

    respond_to do |format|
      format.html { redirect_to athletes_url }
      format.json { head :no_content }
    end
  end
  
  def current_athlete
    current_athlete = current_user.athlete
  end
  
  def following
      @title = "Following"
      @athlete = Athlete.find(params[:id])
      @athletes = @athlete.followed_athletes
      render 'show_follow'
    end

    def followers
      @title = "Followers"
      @athlete = Athlete.find(params[:id])
      @athletes = @athlete.followers
      render 'show_follow'
    end
    
    private
    
    def correct_athlete
      @athlete = Athlete.find(params[:id])
      redirect_to(root_url) unless current_athlete?(@athlete)
    end
end
