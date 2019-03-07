class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
  end

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

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    if @workout.update(workout_params)
      flash[:notice] = "Workout was successfully updated"
      redirect_to workout_path(@workout)
    else
      render 'edit'
    end
  end


private
  def workout_params
    params.require(:workout).permit(:title, :description)
  end
end
