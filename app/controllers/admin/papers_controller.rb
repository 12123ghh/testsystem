class Admin::PapersController < ApplicationController
  def new
  	@paper=Paper.new
  end

  def show
  	@paper=Paper.find(params[:id])
  end

  def index
  	@papers=Paper.all
  end

  def destroy
  	Paper.find(params[:id]).destroy
  	redirect_to  admin_papers_path 
  end
end