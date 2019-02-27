class TestquestionsController < ApplicationController
  def new
  	@testquestion=Testquestion.new
  end

  def show
  	@testquestion=Testquestion.find(params[:id])
  end

  def create
  	@testquestion=Testquestion.new(testquestion_params)
  	if @testquestion.save
  	  redirect_to @testquestion
  	else
      #
  	end
  end

  def index
  	@testquestions=Testquestion.paginate(page:params[:page],:per_page=>1)
  end

  def destroy
  	
  end

  private
  def testquestion_params
  	params.require(:testquestion).permit(:question,:anwser,
  						:optionA,:optionB,:optionC,:optionD)
  end
end
