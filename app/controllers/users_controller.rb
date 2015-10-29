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
    @foods = @user.foods.order(params[:sort])
    @exercises = @user.exercises.order(params[:sort])
    @foods = @foods.paginate(page: params[:page], per_page: 10)
  end
end
