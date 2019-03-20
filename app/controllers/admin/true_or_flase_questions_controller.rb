class Admin::TrueOrFlaseQuestionsController < Admin::BaseController
  before_action :check_admin_login_status
	before_action :find_resource, except: [:index, :new, :create]

	def index
		@true_or_flase_questions = Question.true_or_flase_question.all.order(created_at: :desc)
  															.paginate(page: params[:page])
	end

	def new
		@true_or_flase_question = Question.true_or_flase_question.new
	end

	def create
		@true_or_flase_question = Question.true_or_flase_question.new(true_or_flase_question_params)
		if @true_or_flase_question.save
			flash[:success] = "成功添加判读题"
  		redirect_to admin_true_or_flase_questions_path
		else
			flash[:danger] = "创建判断题失败"
  		render :new
		end
	end

	def edit
	end

	def update
		if @true_or_flase_question.update
			flash[:success] = "成功更新判读题"
  		redirect_to admin_true_or_flase_questions_path
		else
			flash[:danger] = "更新判断题失败"
  		render :edit
		end
	end

	private

  def find_resource
    @true_or_flase_question = Question.true_or_flase_question.find(params[:id])
  end

  def true_or_flase_question_params
  	params.require(:question).permit(:title, :subject_id, :true_answer, :level)
  end
end