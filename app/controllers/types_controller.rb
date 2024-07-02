class TypesController < ApplicationController
  def index
    @types = Type.all
  end

  def show_animes
    @type = Type.find(params[:id])
    @animes = @type.animes
  end
end
