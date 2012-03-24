# encoding: UTF-8

Given /^I have one\s+user "([^\"]*)" with email "([^\"]*)" and password "([^\"]*)"$/ do |name, email, password|
  FactoryGirl.create(:user, {
    :email => email,
    :name => name,
    :password => password})
end

Given /^I am logged in$/ do
  user = FactoryGirl.create(:user)
  step %{I log in with email "#{user.email}" and password "#{user.password}"}
end

Given /^I am not logged in$/ do
  visit path_to("the logout page")
  step %{I should see "Ça faut un compte pour écrire un article."}
end

Given /^I am logged in as an? (.*)$/ do |role|
  case role
  when "administrator"
    user = FactoryGirl.create(:admin)
  when "user"
    user = FactoryGirl.create(:user)
  end
  step %{I log in with email "#{user.email}" and password "#{user.password}"}
end

Given /^I log in with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  step %{I go to the home page}
  step %{I fill in "user_email" with "#{email}"}
  step %{I fill in "user_password" with "#{password}"}
  step %{I press "Connectation"}
end

Given /^I am logged in as "([^"]*)"$/ do |name|
  user = FactoryGirl.create(:user, :name => name)
  step %{I log in with email "#{user.email}" and password "#{user.password}"}
end

When /^I log out$/ do
  visit path_to("the logout page")
end

Then /^I should be logged in as "([^\"]*)"$/ do |name|
  step %{I should not see "Ça faut un compte pour écrire un article."}
  step %{I should see "Salut #{name}"}
end
