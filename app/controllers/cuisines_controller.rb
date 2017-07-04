class CuisinesController < ApplicationController
  before_action :find_cuisine, only: [:edit, :update, :show]

  def show
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(params.require(:cuisine).permit(:name))
    if @cuisine.save
      redirect_to @cuisine
    else
      flash.now[:error] = 'Não foi possível cadastrar a cozinha'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @cuisine.update(cuisine_params)
      redirect_to @cuisine
    else
      flash.now[:error] = 'Não foi possível atualizar a cozinha'
      render :edit
    end
  end

  private

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end

  def find_cuisine
      @cuisine = Cuisine.find(params[:id])
  end

end
