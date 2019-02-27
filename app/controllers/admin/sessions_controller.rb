class Admin::SessionsController < ApplicationController
  def new

  end

  def create
  	user=User.admin.find_by(email:params[:session][:email].downcase)
  	if user&&user.authenticate(params[:session][:password])
  	  log_in(user)
  	  redirect_to admin_admin_user_path(user)
  	else
  	  flash.now[:danger]='invalid email/password/role combination'
  	  render 'new'
  	end
  end

  def destroy
    log_out
    redirect_to new_admin_session_path
  end

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

end
