class CreateGreads < ActiveRecord::Migration
  def change
    create_table :greads do |t|
      t.integer :gread
      t.integer :student_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
