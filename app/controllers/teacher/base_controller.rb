class Teacher::BaseController < ApplicationController
  def check_teacher_login_status
    if !current_user || !current_user.teacher?
      flash[:danger] = "must login or not teacher!"
      redirect_to new_teacher_session_path
    end
  end
end
