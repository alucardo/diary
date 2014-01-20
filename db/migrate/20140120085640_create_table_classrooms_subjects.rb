class CreateTableClassroomsSubjects < ActiveRecord::Migration
  def change
    create_table :table_classrooms_subjects do |t|
      t.belongs_to :classroom
      t.belongs_to :subject
    end
  end
end
