class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session #jQueryの実行に必要
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search

  def after_sign_in_path_for(resource)
    case resource

	  when Admin
	    admin_path
	  when EndUser
	    root_path
	  end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def search
  @user = current_end_user

  @search_params = product_search_params
  @product = Product.search(@search_params)

  end

  private

    def product_search_params
      params.fetch(:search, {}).permit(:title)
    end


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_kana_name, :first_kana_name, :post_code, :address, :phone_number, :email])
      devise_parameter_sanitizer.permit(:sign_in, keys: [ :email])
    end

end

