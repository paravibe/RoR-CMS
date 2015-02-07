class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include UsersHelper

  private

  def confirm_logged_in
    if session[:user_id] && current_user
      return true
    else
      flash[:alert] = "Please log in."
      redirect_to(:controller => 'users', :action => 'login')
      return false
    end
  end

  def is_admin
    if confirm_logged_in && (current_user.roles.ids.include?(1) || current_user.id == 1)
      return true
    else
      render_403
      return false
    end
  end

  def render_404
    respond_to do |format|
      format.html {
        render :file => "#{Rails.root}/public/404", :layout => 'application', :status => :not_found
      }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

  def render_403
    respond_to do |format|
      format.html {
        render :file => "#{Rails.root}/public/403", :layout => 'application', :status => :forbidden
      }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end
end
