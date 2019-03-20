class Admin::QuestionsController < Admin::BaseController
  before_action :check_admin_login_status
  before_action :find_resource, except: [:index, :new, :create]

  def index
    @questions = Question.multiple_choice.all.order(created_at: :desc).paginate(page: params[:page])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "题目创建成功"
      redirect_to admin_questions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      flash[:success] = "题目更新成功"
      redirect_to admin_questions_path
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = "题目删除成功"
      redirect_to admin_questions_path
    else
      flash[:danger] = "题目删除失败"
      redirect_to admin_questions_path
    end
  end

  private
  def find_resource
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :subject_id, :level, options_attributes: [:content, :is_right_answer, :_destroy])
  end
end