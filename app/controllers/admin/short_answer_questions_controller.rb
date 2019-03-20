class Admin::ShortAnswerQuestionsController < Admin::BaseController
  before_action :check_admin_login_status
	before_action :find_resource, except: [:index, :new, :create]

  def index
  	@short_answer_questions = Question.short_answer_question.order(created_at: :desc)
  														.paginate(page: params[:page])
  end

  def new
  	@short_answer_question = Question.short_answer_question.new
  end

  def create
  	@short_answer_question = Question.short_answer_question.new(short_answer_question_params)
  	if @short_answer_question.save
  		flash[:success] = "成功创建简答题"
  		redirect_to admin_short_answer_questions_path
  	else
  		flash[:danger] = "创建简答题失败"
  		render :new
  	end
  end

  def edit	
  end

  def update
  	if @short_answer_question.update
  		flash[:success] = "成功更新简答题"
  		redirect_to admin_short_answer_questions_path
  	else
  		flash[:danger] = "更新简答题失败"
  		render :edit
  	end
  end

  private

  def find_resource
    @short_answer_question = Question.short_answer_question.find(params[:id])
  end

  def short_answer_question_params
  	params.require(:question).permit(:title, :subject_id, :standard_answer, :level)
  end
end