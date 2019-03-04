class ExamsController < BaseController
	before_action :check_user_login_status

	def new_answer
		@exam = Exam.find(params[:id])
		@questions = @exam.paper.questions
		@questions.each do |q|
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

	private 

	def exam_params
		params.require(:exam).permit(answer_attributes: [:option_id])
	end
end
