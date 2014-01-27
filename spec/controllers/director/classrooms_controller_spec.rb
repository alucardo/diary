require 'spec_helper'

describe Director::ClassroomsController do
  let(:s1) {Subject.new(:name => 's1')}
  let(:s2) {Subject.new(:name => 's12')}

  context 'creating classroom' do
    it "include subjects" do
      classroom = Classroom.new(:name => "k1", :subjects => [s1, s2])
      classroom.subjects.should include(s1)
      classroom.subjects.should include(s2)
    end

    it 'raises an error if saved without a name' do
      classroom = Classroom.new
      expect { classroom.save! }.to raise_error( ActiveRecord::RecordInvalid )
    end
  end





end
