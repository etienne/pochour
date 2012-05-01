class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  def ensure_admin!
    render_404 unless user_signed_in? and current_user.admin
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_url
  end
  
  protected
  
  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end  
end
