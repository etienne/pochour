Given /^I am logged in as an administrator$/ do
  admin = Factory(:admin)
  Given %{I go to the home page}
  And %{I fill in "user_email" with "#{admin.email}"}
  And %{I fill in "user_password" with "#{admin.password}"}
  And %{I press "Connectation"}
end

Given /^I have the following user records:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |record|
    Factory(:user, record)
  end
end
