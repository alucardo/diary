class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :students
  has_many :classrooms, through: :students
  has_many :greads


  def self.directors
    with_role(:director)
  end

  def self.teachers
    with_role(:teacher)
  end

  def self.students
    with_role(:student)
  end

  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
     # user.name = auth.info.name   # assuming the user model has a name
     # user.image = auth.info.image # assuming the user model has an image
    end
  end


end
