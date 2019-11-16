class UserCartsController < ApplicationController

def edit
  @user = EndUser.find(params[:id])
end

def update
end

def destroy
end

end
