class Admin::StudentsController < Admin::BaseController
  before_action :check_admin_login_status
  
  def new
  	@user=User.new
  end

  def show
  	@user=User.student.find(params[:id])
  end

  def index
  	@users=User.student.order(created_at: :desc).paginate(page:params[:page])
  end

  def change_status
    @user=User.find(params[:id])
    if @user.update_attributes(status: params[:status])
      flash[:success]="success"
      redirect_to admin_students_path
    else
      flash[:danger]="error"
      redirect_to admin_students_path
    end
  end

  def destroy
  	User.student.find(params[:id]).destroy
  	redirect_to  admin_students_path 
  end
end