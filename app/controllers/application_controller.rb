class ApplicationController < ActionController::Base
	
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
	  case resource
	  when Admin
	    admins_index_path

	  when EndUser
	    user_path(current_end_user)
	  end
  end

    protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_kana_name, :first_kana_name, :post_code, :address, :phone_number, :email])
  end

end
