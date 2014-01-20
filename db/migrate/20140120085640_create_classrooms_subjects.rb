class CreateClassroomsSubjects < ActiveRecord::Migration
  def change
    create_table :classrooms_subjects do |t|
      t.belongs_to :classroom
      t.belongs_to :subject
    end
  end
end
