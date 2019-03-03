class PapersController < BaseController
  before_action :check_user_login_status

  def new
    @user=User.new
   	@paper=Paper.new
   	@paper.questions.build
    @paper.options.build
  end

  def create
    @paper=Paper.new(paper_params)
    @paper.save
  end

  def show
  	
  end

  def index
    @papers = Paper.spass.all.paginate(page: params[:page])
  end

  private
  def paper_params
    params.require(:paper).permit(:title,:subject,
      questions_attributes:[:title,options_attributes:[:content]])
  end
end
