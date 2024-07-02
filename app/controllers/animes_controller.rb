class AnimesController < ApplicationController
  def index
    @animes = Anime.page(params[:page]).per(10)
  end

  def show
  @anime = Anime.find(params[:id])
end

def about
  end
  
def search
    @query = params[:query]
    @type_id = params[:type_id]

    if @type_id.present?
      @animes = Anime.where("title LIKE ? AND type_id = ?", "%#{@query}%", @type_id).page(params[:page]).per(10)
    else
      @animes = Anime.where("title LIKE ?", "%#{@query}%").page(params[:page]).per(10)
    end
  end
end
