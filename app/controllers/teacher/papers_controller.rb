class Teacher::PapersController < Teacher::BaseController
	before_action :check_teacher_login_status

	def new	
		@paper=Paper.new
		@questions=@paper.questions.new
		@options=@questions.options.new	
	end

	def create
		teacher = current_user
		@paper = teacher.papers.new(paper_params)
		if @paper.save
			flash[:success] = "success create paper"
			redirect_to teacher_paper_path(@paper)
		else
			render 'new'
		end
	end

	def show
		@paper = current_user.papers.find(params[:id])
	end

	def edit
		@paper = current_user.papers.find(params[:id])
		@questions = @paper.questions
	end

	def update
		@paper = current_user.papers.find(params[:id])
		if @paper.update_attributes(paper_params)
			flash[:success] = "success change, waitting for check."
			redirect_to teacher_paper_path(@paper)
		else
			render 'edit'
		end
	end

	def index
		@papers = current_user.papers.paginate(page: params[:page])
	end

  def destroy
  	if current_user.papers.find(params[:id]).destroy
  		flash[:success] = "destroy paper"
  		redirect_to  teacher_papers_path 
  	else
  		flash[:danger] = "destroy paper error!"
  		redirect_to  teacher_papers_path
  	end
  end

  def stu_exams
  	@paper = Paper.find(params[:id])
		@exams = @paper.exams.paginate(page: params[:page])
  end

	private 

	def paper_params
		params.require(:paper).permit(:title, :subject_id, :level, :question_number)
	end
end
