class StaticPagesController < ApplicationController
  def home
    redirect_to papers_path if current_user
  end

  def help
  	
  end

  def about
  	
  end
end
