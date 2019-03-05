class Teacher::PapersController < Teacher::BaseController
	before_action :check_teacher_login_status

	def new	
		@paper=Paper.new
		@question=@paper.questions.new
		@option=@question.options.new	
	end

	def create
		teacher = current_user
		@paper=Paper.new(creator: teacher)
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
		@paper = Paper.find(params[:id])
	end

	def update
		@paper = Paper.find(params[:id])
		if @paper.update_attributes(paper_params)
			flash[:success] = "success change"
			redirect_to teacher_papers_path
		else
			flash[:danger] = "update error"
			rander 'update'
		end
	end

	def index
		@teacher = current_user
		@papers = @teacher.papers.paginate(page: params[:page])
	end

	private 

	def paper_params
		params.require(:paper).permit(:title, :subject, :questions_number,
			questions_attributes: [:title, options_attributes: [:content]])
	end
end
