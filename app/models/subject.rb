class Subject < ActiveRecord::Base

  has_and_belongs_to_many :classrooms
  has_many :greads
 # has_many :students, :class_name => "User", :through => classrooms

  belongs_to :teacher, :class_name => "User", :foreign_key => "teacher_id"
  validates :name, :presence => true
end
