class UsersController < ApplicationController

  def index

  end

  def show
  	@user = EndUser.find(params[:id])
  	# @user = current_end_user
  end

  def complete
  end


end
