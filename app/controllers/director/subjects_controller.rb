class Director::SubjectsController < DirectorController

  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :check_teacher, only: [:new]


  def index
    @subjects = Subject.all
    respond_to do |format|
      format.html
      format.json { render json: SubjectsDatatable.new(view_context) }
    end
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to director_subjects_path, notice: 'Subject created' }
      else
        format.html { render action: 'new', alert: 'Error while creating' }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to director_subjects_path, notice: 'Subject edited' }
      else
        format.html { render action: 'edit', alert: 'Error while editing' }
      end
    end
  end


  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to director_subjects_path, notice: 'Group destroy'}
    end
  end






  protected

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, :teacher_id)
  end

  def check_teacher
    if User.teachers.count < 1

      redirect_to director_teachers_path, alert: 'Add Teacher first'
      return
    end
  end


end
