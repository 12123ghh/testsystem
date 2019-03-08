class PapersController < BaseController
  before_action :check_user_login_status

  def new
    @user=User.new
   	@paper=Paper.new
   	@paper.questions.build
    @paper.options.build
  end

  def show
  	
  end

  def index
    @q = Paper.spass.ransack(params[:q])
    @papers = @q.result(distinct: true).order(created_at: :desc).paginate(page: params[:page])
  end

  def create_exam
    paper = Paper.find(params[:id])
    @exam = Exam.new(user: current_user, paper: paper)
    if @exam.save
      redirect_to new_answer_exam_path(@exam)
    else
      flash[:danger] = "create exam error!"
      redirect_to papers_path
    end
  end

  private
  def paper_params
    params.require(:paper).permit(:title,:subject,
      questions_attributes:[:title,options_attributes:[:content]])
  end
end
