class Classroom < ActiveRecord::Base

  has_and_belongs_to_many :subjects

  belongs_to :teacher, :class_name => "User", :foreign_key => "teacher_id"

  has_many :students
  has_many :users, through: :students

  validates :name, :presence => true




end
