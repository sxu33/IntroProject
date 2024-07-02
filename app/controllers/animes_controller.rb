class AnimesController < ApplicationController
  def index
    @animes = Anime.all  
  end

  def show
  @anime = Anime.find(params[:id])
end

def search
    @query = params[:query]
    @type_id = params[:type_id]

    if @type_id.present?
      @animes = Anime.where("title LIKE ? AND type_id = ?", "%#{@query}%", @type_id)
    else
      @animes = Anime.where("title LIKE ?", "%#{@query}%")
    end
  end
end
