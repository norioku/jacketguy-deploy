class AdminsController < ApplicationController

  before_action :authenticate_admin!, only:[:index]

  def index
  	@user = current_admin
  end

end

