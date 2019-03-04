class UsersController < BaseController

  before_action :check_user_login_status, only: [:show, :edit, :update]

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

  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:role,
      							 :password_confirmation)	
  end


end
