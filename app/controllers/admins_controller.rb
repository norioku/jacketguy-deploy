class AdminsController < ApplicationController
  def index
  	@admin = Admin.find(params[:id])
  end

  def create
  end

  def new
  end

end