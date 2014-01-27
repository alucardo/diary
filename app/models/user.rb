class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :students

  def self.directors
    with_role(:director)
  end

  def self.teachers
    with_role(:teacher)
  end

  def self.students
    with_role(:student)
  end


end
