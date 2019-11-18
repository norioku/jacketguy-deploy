class UserPurchasesController < ApplicationController

def new
  @user = current_end_user
end

def create
end

def complete
  @user = current_end_user
end

end
