class UsersController < ApplicationController

  before_action :authenticate_end_user!, except:[:index, :new, :create, :complete]

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
    @user = EndUser.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "ユーザ情報を更新しました。"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "ユーザ情報を更新できませんでした。"
      render :edit
    end
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

