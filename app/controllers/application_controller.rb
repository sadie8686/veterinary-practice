class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: t(:access_denied) #exception.message
  end

  #override and  redirect to appointments page
  def after_sign_in_path_for(user)
    appointments_path
  end


end
