class ApplicationController < ActionController::Base

	before_action :authenticate_user!

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected



	def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up) do |user_params|

	user_params.permit({ roles: [] }, :email, :password, :password_confirmation,:firstname,:image,:lastname)

	end



	devise_parameter_sanitizer.permit(:account_update) do |user_params|

	user_params.permit({ roles: [] }, :email, :password, :password_confirmation,:firstname,:lastname,:image,:current_password)

	end
	end

end

	# helper_method :resource_name, :resource, :devise_mapping, :resource_class

	#   def resource_name
	#     :user
	#   end

	#   def resource
	#     @resource ||= User.new
	#   end

	#   def resource_class
	#     User
	#   end

	#   def devise_mapping
	#     @devise_mapping ||= Devise.mappings[:user]
	#   end

