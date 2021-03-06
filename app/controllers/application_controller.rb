class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

PER = 12

 def after_sign_in_path_for(resource)
      case resource
	      when User
	       top_path
	      when Admin
	        top_path
	  end
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
  	# debugger
    case resource
	      when :user
	        top_path
	      when :admin
	        top_path
	  end
  end







 protected
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
