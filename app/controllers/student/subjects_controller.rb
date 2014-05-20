class Student::SubjectsController < StudentController

  before_action :get_student

  def index

    @subjects = @student.classroom.subjects
  end

  def show
    @subject = Subject.find(params[:id])
    @greads = @subject.greads.where(:student_id => @student.id).map(&:gread)  
  end

  protected

  def get_student
    @student = current_user.students.first
  end
end
