class UserCartsController < ApplicationController

def edit
  @user = EndUser.find(params[:id])
  @carts = Cart.all
end

def update
end

def destroy
end

end
