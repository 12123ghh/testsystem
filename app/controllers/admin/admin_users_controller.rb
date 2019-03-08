class Admin::AdminUsersController < Admin::BaseController
	before_action :check_admin_login_status

  def show
		@admin = current_user
  end

end
