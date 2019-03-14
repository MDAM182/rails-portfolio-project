class WelcomeController < ApplicationController
  def index
    redirect_to workouts_path if logged_in?
  end
end
