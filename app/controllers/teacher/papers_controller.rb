class Teacher::PapersController < ApplicationController

	def new
		@teacher=User.teacher.find(params[:id])	
		@paper=Paper.new	
	end

	def create
		@teacher=User.teacher.find(params[:id])
		@pape=Papers.new
		if @paper.update(paper_params)
			flash[:success]="success create paper"
		else
			render 'new'
		end
	end


	private 

	def paper_params
		params.require(:paper).permit(:title,:subject,:questions_number,:creator_id)
	end
end
