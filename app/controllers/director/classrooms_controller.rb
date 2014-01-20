class Director::ClassroomsController < DirectorController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]

  def index
    @classrooms = Classrooms.all
    respond_to do |format|
      format.html
      format.json { render json: ClassroomsDatatable.new(view_context) }
    end
  end

  def show

  end

  def new
    @classroom = Classrooms.new
  end

  def create
    @classroom = Classrooms.new(classroom_params)

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to director_classrooms_path, notice: 'Group created' }
      else
        format.html { render action: 'new', alert: 'Error while creating' }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html { redirect_to director_classrooms_path, notice: 'Group edited' }
      else
        format.html { render action: 'edit', alert: 'Error while editing' }
      end
    end
  end


  def destroy
    @classroom.destroy
    respond_to do |format|
      format.html { redirect_to director_classrooms_path, notice: 'Group destroy'}
    end
  end


  private

  def set_classroom
    @classroom = Classrooms.find(params[:id])
  end

  def classroom_params
    params.require(:classrooms).permit(:name)
  end

end
