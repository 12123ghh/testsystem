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
  
  #一下是实现审核试卷的方法
  
  #1、获取审核中的试卷列表 
  
  #2、选择试卷查看详情
  
  #3、提交审核结果
  
end
