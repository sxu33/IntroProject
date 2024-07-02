class SeasonsController < ApplicationController
  def index
    @seasons = Season.all
  end

  def show_animes
    @season = Season.find(params[:id])
    @animes = @season.animes
  end
end
