class RelationshipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @athlete = Athlete.find(params[:relationship][:followed_id])
    current_athlete.follow!(@athlete)
    redirect_to @athlete
  end

  def destroy
    @athlete = Relationship.find(params[:id]).followed
    current_athlete.unfollow!(@athlete)
    redirect_to @athlete
  end
  
  def current_athlete
    current_athlete = current_user.athlete
  end  
  
end