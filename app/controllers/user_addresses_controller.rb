class UserAddressesController < ApplicationController

def show
end

def new
	@user_addresses = User_addresses.new
end

def create
	@user_addresses = User_addresses.new(user_addresses_params)
   		if @user_addresses.save
     	 redirect_to user_path(@user.id)
end

def edit
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

end
