class AdminsController < ApplicationController
  def index
  	@user = current_admin
  end

  def new
  end

  def create
  end


end
