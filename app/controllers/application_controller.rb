class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :categories
  before_action :brands
  
  helper_method :current_order


  	def categories
  		@categories = Category.order(:name)
  	end

  	def brands
  		@brands = Product.pluck(:brand).uniq.sort
  	end

  	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys:[:role])
  		devise_parameter_sanitizer.permit(:account_update, keys:[:role])
 end



 def current_order
  if session[:order_id] 
    return Order.find(session[:order_id])
  else
    return Order.new
  end
 end
end
