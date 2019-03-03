class Teacher::BaseController < ApplicationController
	def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user?(user)
    user == current_user
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def require_teacher
    if !current_user || !current_user.teacher?
      flash[:danger] = "must login or not teacher!"
      redirect_to new_teacher_session_path
    end
  end
end
