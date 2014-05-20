class HomeController < ApplicationController
  def index
  end

  def register
    if current_user.has_role? :director
      redirect_to director_index_path
    elsif current_user.has_role? :teacher
      redirect_to teacher_index_path
    elsif current_user.has_role? :student
      redirect_to student_index_path
    else
      redirect_to root_path
    end
  end


end
