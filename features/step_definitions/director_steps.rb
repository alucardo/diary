require 'pry'

Given(/^I am at the login page$/) do
  u = User.new(
      :email => "przemyslaw.olesinski@polcode.net",
      :password => 'zaq12wsx'
  )
  u.add_role :director
  u.save!
  visit new_user_session_path
end

When(/^I fill login form and submit$/) do
  fill_in "user_email", :with => "przemyslaw.olesinski@polcode.net"
  fill_in "user_password", :with => 'zaq12wsx'
  click_button "Sign in"
end

Then(/^I should be redirect to director home page$/) do
  current_path.should == director_index_path
end
