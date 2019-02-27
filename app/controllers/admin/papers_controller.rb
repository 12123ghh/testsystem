class Admin::PapersController < ApplicationController
  def new
  	@paper=Paper.new
  end

  def show
  	@paper=Paper.find(params[:id])
  end

  def index
  	@papers=Paper.spass.paginate(page:params[:page],:per_page=>2)
  end

  def review
  	@papers=Paper.check.paginate(page:params[:page],:per_page=>2)
  end

  def editreview
  	@paper=Paper.find(params[:id])
  end
  def updatereview
  	@paper=Paper.check.find(params[:id])
  	if @paper.update_attributes(review_params)
  		flash[:success]="success"
  		redirect_to review_admin_paper_path
  	else
  		
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