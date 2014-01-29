class CreateCreateGreads < ActiveRecord::Migration
  def change
    create_table :create_greads do |t|
      t.integer :gread
      t.integer :user_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
