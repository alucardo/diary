class Subjects < ActiveRecord::Base
  validates :name, :presence => true
end
