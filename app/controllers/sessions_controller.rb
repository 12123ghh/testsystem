class SessionsController < ApplicationController
  def new
    redirect_to root_url if current_user
  end

  def create
  	user=User.student.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  	  log_in user
  	  redirect_to root_url
  	else
  	  flash.now[:danger] = 'invalid email/password combination'
  	  render 'new'
  	end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
