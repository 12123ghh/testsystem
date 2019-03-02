class Admin::AdminUsersController < ApplicationController

  def show
		@admin=User.admin.find(params[:id])	 
  end

end

