Given /^I am logged in as an? (.*)$/ do |role|
  case role
  when "administrator"
    user = Factory(:admin)
  when "user"
    user = Factory(:user)
  end
  Given %{I go to the home page}
  And %{I fill in "user_email" with "#{user.email}"}
  And %{I fill in "user_password" with "#{user.password}"}
  And %{I press "Connectation"}
end

Given /^I have the following user records:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |record|
    Factory(:user, record)
  end
end
