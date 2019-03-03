class Admin::BaseController < ApplicationController
	def log_in(user)
    session[:user_id]=user.id
  end

  def current_user
    @current_user||=User.find_by(id:session[:user_id])
  end

  def current_user?(user)
    user==current_user
  end

  def log_out
    session.delete(:user_id)
    @current_user=nil
  end

  def require_admin
    if !current_user || !current_user.admin?
      flash[:danger] = "must login or not admin!"
      redirect_to new_admin_session_path
    end
  end
end