class UserAddressesController < ApplicationController

  before_action :authenticate_end_user!, only:[:new, :create, :edit, :update, :destroy]

  def new
  	@user_address = Address.new
    @user = current_end_user
  end

  def create
    @user = current_end_user
  	@user_address = Address.new(user_address_params)
    @user_address.end_user_id = current_end_user.id
  	if @user_address.save
      flash[:success] = "お届け先を追加しました。"
   	  redirect_to user_path(@user)
    else
      flash[:danger] = "お届け先を削除できませんでした。"
      render :new
    end
  end

   def edit
    @user = current_end_user
   	@user_address = Address.find(params[:id])
   end

   def update
    @user = current_end_user
   	@user_address = Address.find(params[:id])

    if @user_address.update(user_address_params)
      flash[:success] = "お届け先の更新に成功しました。"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
   end

  def destroy

  	@user_address = Address.find(params[:id])
  	if @user_address.destroy
      flash[:success] = "お届け先住所を削除しました。"
  	 redirect_to user_path(current_end_user.id)
    else
      flash[:danger] = "お届け先住所を削除できませんでした。"
      render :show
    end
  end

  private

    def user_address_params
      params.require(:address).permit(:email, :last_name, :first_name, :last_kana_name, :first_kana_name, :post_code, :address, :phone_number)
    end

end

