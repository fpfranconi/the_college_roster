class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if current_user.athlete && Athlete.exists?(current_user.athlete.id)
      athlete_path(current_user.athlete.id)
    else
      new_athlete_path
    end
  end
end
