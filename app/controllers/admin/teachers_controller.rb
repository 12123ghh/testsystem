class Admin::TeachersController < ApplicationController
  def new
  	@user=User.new
  end

  def show
  	@user=User.teacher.find(params[:id])
  end

  def index
  	@users=User.teacher.paginate(page:params[:page])
  end

  def change_status
    @user=User.find(params[:id])
    if @user.update(status: params[:status])
      flash[:success]="success"
      redirect_to admin_teachers_path
    else
      flash[:danger]="error"
      redirect_to admin_teachers_path
    end
  end

  def destroy
  	User.teacher.find(params[:id]).destroy
  	redirect_to  admin_teachers_path 
  end
end