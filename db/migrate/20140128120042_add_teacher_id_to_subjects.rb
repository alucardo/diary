class AddTeacherIdToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :teacher_id, :integer
  end
end
