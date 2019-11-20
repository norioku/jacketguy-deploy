class UsersController < ApplicationController

  def show
    @user = current_end_user
    @addresses = current_end_user.addresses
    @favorites = current_end_user.favorites
    @order_histories = current_end_user.order_histories

  	# @user = current_end_user
  end

  def edit
    @user = EndUser.find(params[:id])
  end

  def update
  end

  def destroy
    @user = current_end_user
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to user_path(@user.id)
  end

  def close
    @user = EndUser.find(params[:id])
  end

  def complete
    @user = current_end_user
  end

end