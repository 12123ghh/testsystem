class Admin::PapersController < Admin::BaseController
  before_action :check_admin_login_status 

  def new
  	@paper=Paper.new
  end

  def show
  	@paper=Paper.find(params[:id])   
  end

  def index
  	@papers=Paper.all.order(created_at: :desc).paginate(page:params[:page])
  end

  def review
  	@papers=Paper.check.paginate(page:params[:page])
  end

  def editreview
  	@paper=Paper.find(params[:id])
  end

  def updatereview
  	@paper=Paper.check.find(params[:id])

  	if @paper.update_attributes(review: params[:review])
  		flash[:success]="success"
  		redirect_to admin_papers_path
  	else
  		flash[:danger]="error"
      redirect_to admin_papers_path
  	end

  end

  def destroy
  	Paper.find(params[:id]).destroy
  	redirect_to  admin_papers_path 
  end

  private 

  def review_params
  	params.require(:paper).permit(:review)
  end

end