class Teacher::ClassroomsController < TeacherController

  before_action :set_classroom, only: :show

  def index
    @classrooms = Classroom.find_all_by_teacher_id(current_user.id)
  end

  def show

  end

  protected

  def set_classroom
    @classroom = Classroom.find(params[:id])
  end

end
