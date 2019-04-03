class Teacher::ExamsController < Teacher::BaseController
  before_action :check_teacher_login_status
  before_action :find_paper

  def index
    @exams = @paper.exams.order(created_at: :desc).paginate(page: params[:page])
  end

  def show
    @exam = @paper.exams.find_by(params[:id])
  end

  def mark
    @exam = @paper.exams.includes(short_answer_question_answers: :question).find_by(params[:id])
  end

  def mark_score
    @exam = @paper.exams.find_by(params[:id])
    if @exam.update(exam_params)
      redirect_to teacher_paper_exam_path(@paper, @exam)
    else
      render :mark
    end
  end

  private 

  def find_paper
    @paper = current_user.papers.includes(:exams).find(params[:paper_id])
  end

  def exam_params
    params.require(:exam).permit(answers_attributes: [:id, :score])
  end
end
