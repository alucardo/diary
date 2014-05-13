class Teacher::SubjectsController < TeacherController

  before_action :set_subject, only: [:show]

  def index
    @subjects = Subject.find_all_by_teacher_id(current_user.id)
  end

  def show
    @students = @subject.classrooms.first.students
  end

  protected

  def set_subject
    @subject = Subject.find(params[:id])
  end

end
