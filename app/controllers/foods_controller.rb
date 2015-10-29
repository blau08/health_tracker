class FoodsController < ApplicationController
  def index
    if params[:search]
      @foods = Food.search(params[:search]).order("created_at DESC")
    else
      @foods = Food.order("created_at DESC")
    end

    @search_param = params[:search]
    
    respond_to do |format|
      format.html
      format.js
    end
  end

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
