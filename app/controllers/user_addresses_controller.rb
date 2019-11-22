class UserAddressesController < ApplicationController

def show
end

def new
	@user_address = Address.new
  @user = current_end_user
end

def create
  @user = current_end_user
	@user_address = Address.new(user_address_params)
  @user_address.end_user_id = current_end_user.id
	@user_address.save
 	redirect_to user_path(@user)
end

 def edit
  @user = current_end_user
 	@user_address = Address.find(params[:id])
 end

 def update
  @user = current_end_user
 	 @user_address = Address.find(params[:id])
      @user_address.update(user_address_params)
      redirect_to user_path(@user.id)
 end

def destroy
	@user_addresses = User_addresses.find(params[:id])
	if book.destroy
	redirect_to user_path(@user.id)
end

private

  def user_address_params
    params.require(:address).permit(:email, :last_name, :first_name, :last_kana_name, :first_kana_name, :post_code, :address, :phone_number)
end

# def user_params
#     params.require(:end_user).permit(:email, :last_name, :first_name, :last_kana_name, :first_kana_name, :post_code, :address, :phone_number)
#   end


end

# t.integer "end_user_id"
#     t.string "email", default: "", null: false
#     t.string "last_name"
#     t.string "first_name"
#     t.string "last_kana_name"
#     t.string "first_kana_name"
#     t.string "post_code"
#     t.string "address"
#     t.string "phone_number"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end