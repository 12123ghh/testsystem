class UsersController < BaseController

  before_action :check_user_login_status, on: [:show, :edit, :update]

  def new
  	@user=User.new
  end

  def show
  	@user=User.find(params[:id])
  end

  def create
  	@user=User.student.new(user_params)
  	if @user.save
  	  log_in @user
  	  flash[:success]="wecome!"
  	  redirect_to @user
  	else
  	  render 'new'
  	end
  end

  def edit
    
  end

  def update

    if @user.update_atrributes(user_params)
      
    else
      
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success]="User deleted"
    redirect_to users_url
  end
  
  def index
    @users=User.paginate(page:params[:page],:per_page=>5)
  end

  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:role,
      							 :password_confirmation)	
  end

  def logged_in_user
    unless logged_in?
      flash[:danger]="please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user=User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
