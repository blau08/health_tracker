class ExercisesController < ApplicationController
  def new
    @user = current_user
    @exercise = Exercise.new
    respond_to do |format|
      format.html {}
      format.js
    end
  end

  def create
    @user = current_user
    @exercises = @user.exercises
    @exercise = Exercise.new(exercise_params)
    @exercise.user = @user

    if @exercise.save
      respond_to do |format|
        format.html {}
        format.js
      end
    else
      flash[:notice] = "Exercise not saved"
    end
  end

  private
  def exercise_params
    params.require(:exercise).permit(:name, :calories)
  end
end
