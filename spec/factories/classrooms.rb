# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :classroom, :class => 'Classrooms' do
    name "MyString"
  end
end
