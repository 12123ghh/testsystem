class Admin::SentenceCompletionsController < Admin::BaseController
  before_action :check_admin_login_status
	before_action :find_resource, except: [:index, :new, :create]

  def index
  	@sentence_completions = Question.sentence_completion.order(created_at: :desc)
  														.paginate(page: params[:page])
  end

  def new
  	@sentence_completion = Question.sentence_completion.new
  end

  def create
  	@sentence_completion = Question.sentence_completion.new(sentence_completion_params)
  	if @sentence_completion.save
  		flash[:success] = "成功创建填空题"
  		redirect_to admin_sentence_completions_path
  	else
  		flash[:danger] = "创建填空题失败"
  		render :new
  	end
  end

  def edit	
  end

  def update
  	if @sentence_completion.update
  		flash[:success] = "成功更新填空题"
  		redirect_to admin_sentence_completions_path
  	else
  		flash[:danger] = "更新填空题失败"
  		render :edit
  	end
  end

  private

  def find_resource
    @sentence_completion = Question.sentence_completion.find(params[:id])
  end

  def sentence_completion_params
  	params.require(:question).permit(:title, :subject_id, :standard_answer, :level)
  end
end