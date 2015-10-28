class FoodsController < ApplicationController
  def new
    @user = current_user
    @food = Food.new
    respond_to do |format|
      format.html {}
      format.js
    end
  end

  def index

  end
end
