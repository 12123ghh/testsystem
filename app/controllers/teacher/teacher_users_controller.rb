class Teacher::TeacherUsersController < Teacher::BaseController
  before_action :check_teacher_login_status, only: [:show, :edit, :update]

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
  	@user = current_user
  end

  def edit
  	@user = current_user
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

  private 

  def teacher_params
  	params.require(:user).permit(:name,:email,:password,
      					:password_confirmation)
  end

end
