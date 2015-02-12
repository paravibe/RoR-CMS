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
      return false
    end
  end

  def is_admin
    if confirm_logged_in && (current_user.roles.ids.include?(1) || current_user.id == 1)
      return true
    else
      render_error(403)
      return false
    end
  end

  def render_error(error)
    case error
      when 404
        status = :not_found
      when 403
        status = :forbidden
    end

    respond_to do |format|
      format.html {
        render :file =>
          "#{Rails.root}/public/#{error}",
          :layout => 'application',
          :status => status
      }
      format.xml  { head status }
      format.any  { head status }
    end
  end
end
