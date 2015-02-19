class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  class AccessDenied < StandardError
  end

  rescue_from AccessDenied, with: :render_404

  helper_method :current_user
  helper_method :is_admin?
  helper_method :authorize_admin

private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def is_admin?
    result = false
    if current_user && current_user.role = "Admin"
      result = true
    end
  end

  def authorize_admin
    raise AccessDenied unless(is_admin?)
  end

  def render_404
    render file: "public/404", status: 404, layout: false
  end
  
end
