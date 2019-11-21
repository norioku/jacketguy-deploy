class UsersController < ApplicationController

  def show
  	@user = EndUser.find(params[:id])
  	# @user = current_end_user
  end

  def edit
    @user = EndUser.find(params[:id])
  end

  def update
    @user = EndUser.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
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
    @user = current_end_user
  end

  private

  def user_params
    params.require(:end_user).permit(:email, :last_name, :first_name, :last_kana_name, :first_kana_name, :post_code, :address, :phone_number)
  end

end

