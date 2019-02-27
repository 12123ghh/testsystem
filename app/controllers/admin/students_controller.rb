class Admin::StudentsController < ApplicationController
  def new
  	@user=User.new
  end

  def show
  	@user=User.student.find(params[:id])
  end

  def index
  	@users=User.student.all
  end

  def destroy
  	User.student.find(params[:id]).destroy
  	redirect_to  admin_students_path 
  end
end