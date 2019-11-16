class UsersController < ApplicationController

  def show
  	@user = EndUser.find(params[:id])
  	# @user = current_end_user
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  def close
  end
  
  def complete
  end

end