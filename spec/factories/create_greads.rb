# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :create_gread, :class => 'CreateGreads' do
    gread 1
    user_id 1
    subject_id 1
  end
end
