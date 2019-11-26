class UserGenresController < ApplicationController

  def show
  	@genre = Genre.find(params[:id])
  	@products = @genre.products.all
  	@products = @genre.products.page(params[:page]).per(10)
  	@genres = Genre.all
  end

end
