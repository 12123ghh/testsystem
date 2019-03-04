class Teacher::TeacherUsersController < Teacher::BaseController
  before_action :check_teacher_login_status, only: [:show, :edit, :update, :edit_password, :update_password]

  def new
  	@user=User.new
  end

  def create
  	@user=User.teacher.new(teacher_params)
  	if @user.save
  		log_in(@user)
  		flash[:success]="welcome!"
  		redirect_to teacher_teacher_user_path(@user)
  	else
  	  render 'new'	
  	end
  end

  def show
  	@user=User.find(params[:id])
  end

  def edit
  	@user=User.find(params[:id])
  end

  def edit_password
  	@user=User.find(params[:id])
  end

  def update
  	if @user.update_attribute(update_params)
  	  flash[:success]="success!"
  	  redirect_to teacher_teacher_user_path(@user) 	  
  	else
  	  flash.now[:danger]='invalid name/email combination'
  	  render 'edit'
  	end
  end

  def update_password
  	@user=User.find(params[:id])
  	if @user.update_attributes(password_params)
  	  flash[:success]="success!"
  	  redirect_to teacher_teacher_user_path(@user)
  	else
  	  flash.now[:danger]='invalid password/password_confirmation combination'
  	  render 'edit_password'
  	end
  end

  private 

  def teacher_params
  	params.require(:user).permit(:name,:email,:password,
      					:password_confirmation)
  end

  def update_params
  	params.require(:user).permit(:name,:email)
  end

  def password_params
  	params.require(:user).permit(:password,:password_confirmation)
  end
end
