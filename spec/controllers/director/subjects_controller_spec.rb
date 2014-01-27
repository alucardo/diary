require 'spec_helper'

describe Director::SubjectsController do
  it "creates the subject with name" do
    subject = Subject.new(:name => 'Math')
    subject.name.should == 'Math'
  end

  it 'is invalid without a name' do
    subject = Subject.new
    subject.should_not be_valid
  end




end
