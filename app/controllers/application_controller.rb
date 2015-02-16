class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def index

  end
  
  private
  def load_classes
    @classes = current_user.klasses
    @classes_created_by_me = current_user.created_klasses
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :dept
    devise_parameter_sanitizer.for(:sign_up) << :code
    devise_parameter_sanitizer.for(:account_update) << :name
    devise_parameter_sanitizer.for(:account_update) << :dept
    devise_parameter_sanitizer.for(:account_update) << :code
  end
end
