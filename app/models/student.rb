class Student < ActiveRecord::Base

  belongs_to :classroom
  belongs_to :user
  has_many :greads

  def get_graeds_from_subject(subject_id)
    g = self.greads.where(:subject_id => subject_id)
    g.map(&:gread).join(', ')
  end
end
