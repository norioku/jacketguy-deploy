class UserAddressesController < ApplicationController

def show
  @user = current_end_user
end

def new
	@user_addresses = User_addresses.new
  @user = current_end_user
end

def create
	@user_addresses = User_addresses.new(user_addresses_params)
   		if @user_addresses.save
     	 redirect_to user_path(@user.id)
      end
end

def edit
  @user = current_end_user
	@user_addresses = User_addresses.find(params[:id])
end

def update
	@user_addresses = User_addresses.find(params[:id])
	@user_addresses(user_addresses_params)
    flash[:notice] = "Book was successfully created."
    redirect_to user_path(@user.id)
end

def destroy
	@user_addresses = User_addresses.find(params[:id])
	if book.destroy
	redirect_to user_path(@user.id)
end

private

  def user_addresses_params
    
  end

end
