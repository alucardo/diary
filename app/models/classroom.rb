class Classroom < ActiveRecord::Base

  has_and_belongs_to_many :subjects

  validates :name, :presence => true



end
