class ExercisesController < ApplicationController
  def new
    @user = current_user
    @exercise = Exercise.new
    respond_to do |format|
      format.html {}
      format.js
    end
  end
end
