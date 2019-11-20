class UserPurchasesController < ApplicationController

def new
  @user = EndUser.find(params[:id])
  
end

def create
end

def complete
  @user = current_end_user
end

end
