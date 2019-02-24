class OptionsController < ApplicationController
  def new
  	@oprion=Option.new
  end

  def create
  	
  end

  private

  def option_params
  	params.require(:option).permit(:content)
  end
end
