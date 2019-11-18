class UsersController < ApplicationController

  def show
  	@user = EndUser.find(params[:id])
  	# @user = current_end_user
  end

  def edit
  end

  def update
  end

  def destroy
    @user = EndUser.find(params[:id])
    @user.destroy
    redirect_to users_close_path
  end

  def close
    @user = EndUser.find(params[:id])
  end

  def complete
  end

end