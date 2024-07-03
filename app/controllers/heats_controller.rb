class HeatsController < ApplicationController
  def index
    @heats = Heat.page(params[:page]).per(10)
  end

  def show_anime
    @heat = Heat.find(params[:id])
    @anime = @heat.anime
  end
end
