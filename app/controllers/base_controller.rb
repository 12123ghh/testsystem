class BaseController < ApplicationController
  def check_user_login_status
    if !current_user
      flash[:danger] = "must login!"
      redirect_to login_path
    end
  end

end