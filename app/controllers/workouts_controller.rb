class WorkoutsController < ApplicationController

  def new
     @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      flash[:notice] = "Workout was successfully created"
      redirect_to workout_path(@workout)
    else
      render 'new'
    end
  end

  def show
    @workout = Workout.find(params[:id])
  end

private
  def workout_params
    params.require(:workout).permit(:title, :description)
  end
end
