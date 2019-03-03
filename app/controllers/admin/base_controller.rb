class Admin::BaseController < ApplicationController
  def check_admin_login_status
    if !current_user || !current_user.admin?
      flash[:danger] = "must login or not admin!"
      redirect_to new_admin_session_path
    end
  end
end