class PapersController < ApplicationController

  def new
 	@paper=Paper.new
 	@paper.questions.build
  @paper.options.build
  end

  def create
    @paper=Paper.new(paper_params)
    if @paper.save

    else

    end	
  end

  def show
  	
  end

  private
  def paper_params
    params.require(:paper).permit(:title,:subject,:question_number,
      questions_attributes: [:title,:options_attributes=>[:content]])
  end
end
