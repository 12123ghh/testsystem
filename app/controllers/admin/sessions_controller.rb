class Admin::SessionsController < Admin::BaseController
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


end
