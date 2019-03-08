class Admin::SubjectsController < Admin::BaseController
  before_action :check_admin_login_status
  before_action :find_resource, except: [:index, :new, :create]

  def index
    @subjects = Subject.all.order(created_at: :desc).paginate(page: params[:page])
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:success] = "科目创建成功"
      redirect_to admin_subjects_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @subject.update(subject_params)
      flash[:success] = "科目更新成功"
      redirect_to admin_subjects_path
    else
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      flash[:success] = "科目删除成功"
      redirect_to admin_subjects_path
    else
      flash[:danger] = "科目删除失败"
      redirect_to admin_subjects_path
    end
  end

  private
  def find_resource
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name)
  end
end