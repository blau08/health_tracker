class FoodsController < ApplicationController
  def index
    if params[:search]
      @foods = Food.search(params[:search]).select('DISTINCT ON (foods.name) foods.name, foods.id, foods.calories').order("name")
    else
      @foods = Food.select(:name).distinct.order("name")
    end

    @search_param = params[:search]
    # @foods = @foods.paginate(:page => params[:page], :per_page => 10)
    @searched_foods = @foods


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

  def add
    @user = current_user
    @added_food = Food.find(params[:id])

    @food = Food.new(name: @added_food.name, calories: @added_food.calories)
    @food.user = @user
    @food.save

    respond_to do |format|
      format.html {}
      format.js
    end

  end

  def show

  end

  private
  def food_params
    params.require(:food).permit(:name, :calories)
  end
end
