class UsersController < ApplicationController
  def index
    @user = current_user
    @foods = @user.foods
  end

  def new

  end

  def create

  end

  def show
    @user = current_user
    @foods = @user.foods
    @exercises = @user.exercises
  end
end
