class Teacher::SessionsController < Teacher::BaseController
  def new

  end

  def create
  	user=User.teacher.find_by(email:params[:session][:email].downcase)
  	if user&&user.authenticate(params[:session][:password])
  	  log_in(user)
  	  redirect_to teacher_teacher_user_path
  	else
  	  flash.now[:danger]='invalid email/password combination'
  	  render 'new'
  	end
  end

end
