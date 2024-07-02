class HeatsController < ApplicationController
  def index
    @heats = Heat.all
  end

  def show_anime
    @heat = Heat.find(params[:id])
    @anime = @heat.anime
  end
end
