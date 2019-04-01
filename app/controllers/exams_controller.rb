class ExamsController < BaseController
	before_action :check_user_login_status

	def new_answer
		@exam = Exam.find(params[:id])
		@questions = @exam.paper.questions
		@questions.order(question_type: :asc).each do |q|
			@exam.answers.build(question: q)
		end
	end

	def create_answer
		@exam = Exam.find(params[:id])
		if @exam.update(exam_params)
			flash[:success] = "finish"
			redirect_to papers_path
		else
			flash[:danger] = "sbumit error!"
			render 'new_answer'
		end
	end

	def show
		@exam = current_user.exams.find(params[:id])
	end

	def index
		@exams = current_user.exams.paginate(page: params[:page])
	end

	private 

	def exam_params
		params.require(:exam).permit(answers_attributes: [:option_id, :question_id, :content, :true_answer])
	end
end
