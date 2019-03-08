class Teacher::SessionsController < Teacher::BaseController
  def new
    redirect_to teacher_root_path if current_user
  end

  def create
  	user=User.teacher.find_by(email:params[:session][:email].downcase)
  	if user&&user.authenticate(params[:session][:password])
  	  log_in(user)
  	  redirect_to teacher_root_path
  	else
  	  flash.now[:danger]='invalid email/password combination'
  	  render 'new'
  	end
  end

end
