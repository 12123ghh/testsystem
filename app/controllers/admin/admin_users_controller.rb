class Admin::AdminUsersController < ApplicationController

  def show
	@admin_user=User.admin.find(params[:id])	 
  end
end
