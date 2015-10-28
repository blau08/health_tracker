class FoodsController < ApplicationController
  def new
    @user = current_user
    @food = Food.new
    respond_to do |format|
      format.html {}
      format.js
    end
  end

  def create
    @user = current_user
    @foods = @user.foods
    @food = Food.new(food_params)
    @food.user = @user

    if @food.save
      respond_to do |format|
        format.html {}
        format.js
      end
    else
      flash[:notice] = "Food not saved"
    end
  end

  private
  def food_params
    params.require(:food).permit(:name, :calories)
  end
end
