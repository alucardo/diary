class Teacher::GreadController < TeacherController

  def new
    @gread = Student.find(params[:student_id]).greads.new
  end

  def create
    @gread = Student.find(params[:student_id]).greads.new
    s = Subject.find(params[:subject_id])
    @gread.subject = s
    @gread.gread =  params[:gread][:gread]

    if @gread.save
      redirect_to teacher_subject_path s, notice: 'Gread added'
    else
      render 'new'
    end
  end

end
