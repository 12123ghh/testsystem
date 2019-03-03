class Admin::AdminUsersController < Admin::BaseController
	before_action :require_admin

  def show
		@admin=User.admin.find(params[:id])	 
  end

end

