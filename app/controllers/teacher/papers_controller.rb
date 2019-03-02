class Teacher::PapersController < ApplicationController

	def new
		#@teacher=User.teacher.find(params[:id])	
		@paper=Paper.new
		@question=@paper.questions.new
		@option=@question.options.new	
	end

	def create
		# @teacher=User.teacher.find(params[:id])
		@teacher=User.teacher.first
		@paper=Paper.new(creator: @teacher)
		if @paper.update!(paper_params)
			flash[:success]="success create paper"
			redirect_to teacher_papers_path
		else
			flash[:danger] = "error"
			render 'new'
		end
	end

	def show
		@paper=Paper.find(params[id])
	end

	def edit
		
	end

	def index
		@papers=Paper.all.paginate(page: params[:page])
	end

	private 

	def paper_params
		params.require(:paper).permit(:title, :subject, :questions_number,
			questions_attributes: [:title, options_attributes: [:content]])
	end
end
