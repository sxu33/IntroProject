class HeatsController < ApplicationController
  def index
    @heats = Heat.all
  end

  def show_animes
    @heat = Heat.find(params[:id])
    @animes = @heat.animes
  end
end
