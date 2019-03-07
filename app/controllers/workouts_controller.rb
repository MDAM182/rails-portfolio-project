class Workoutscontroller < ApplicationController

  def new
     @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.save
    redirect_to workout_path(@workout)
  end

private
  def workout_params
    params.require(:workout).permit(:title, :description)
  end
end
