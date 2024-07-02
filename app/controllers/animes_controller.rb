class AnimesController < ApplicationController
  def index
    @animes = Anime.all  # 获取所有Anime记录
  end
end
