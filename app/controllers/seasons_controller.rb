class SeasonsController < ApplicationController
  def index
    @seasons = Season.page(params[:page]).per(10)
  end

  def show_animes
    @season = Season.find(params[:id])
    @animes = @season.animes
  end
end
