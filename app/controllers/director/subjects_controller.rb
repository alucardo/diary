class Director::SubjectsController < DirectorController

  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = Subjects.all
    respond_to do |format|
      format.html
      format.json { render json: SubjectsDatatable.new(view_context) }
    end
  end

  def new
    @subject = Subjects.new
  end

  def create
    @subject = Subjects.new(subject_params)

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






  private

  def set_subject
    @subject = Subjects.find(params[:id])
  end

  def subject_params
    params.require(:subjects).permit(:name)
  end


end
