class Admin::TeachersController < ApplicationController
  def new
  	@user=User.new
  end

  def show
  	@user=User.teacher.find(params[:id])
  end

  def index
  	@users=User.teacher.all
  end

  def destroy
  	User.teacher.find(params[:id]).destroy
  	redirect_to  admin_teachers_path 
  end
end