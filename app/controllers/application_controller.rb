class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  def ensure_admin!
    render_404 unless user_signed_in? and current_user.admin
  end
  
  protected
  
  def render_404
    render :file => "#{Rails.root}/public/404.html", :status => 404
  end  
end
