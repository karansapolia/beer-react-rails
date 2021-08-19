class Api::V1::BeersController < ApplicationController
  before_action :set_beer, only: %i[show edit update destroy]

  def index
    @beers = Beer.all.order(brand: :asc)
    render json: @beers
  end

  def show
    if @beer
      render json: @beer
    else
      render json: @beer.errors
    end
  end

  def new
    @beer = Beer.new
  end

  def edit; end

  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      render json: @beer
    else
      render json: @beer.errors
    end
  end

  def update; end

  def destroy
    @beer.destroy

    render json: { notice: 'Beer was successfully removed.' }
  end

  private

  def set_beer
    @beer = Beer.find(params[:id])
  end

  def beer_params
    params.permit(:brand, :style, :country, :quantity)
  end
end
