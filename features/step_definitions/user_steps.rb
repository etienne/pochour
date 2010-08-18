Given /^I am not logged in$/ do
  Given "I go to the logout page"
  Then %{I should see "Ça faut un compte pour écrire un article."}
end

Given /^I have one\s+user "([^\"]*)" with email "([^\"]*)" and password "([^\"]*)"$/ do |name, email, password|
  Factory(:user, {
    :email => email,
    :name => name,
    :password => password})
end

Given /^I am a new, logged in user$/ do
  user = Factory(:user)
  Given %{I log in with email "#{user.email}" and password "#{user.password}"}
end

Given /^I am logged in as an? (.*)$/ do |role|
  case role
  when "administrator"
    user = Factory(:admin)
  when "user"
    user = Factory(:user)
  end
  Given %{I log in with email "#{user.email}" and password "#{user.password}"}
end

Given /^I log in with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  Given %{I go to the home page}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Connectation"}
end

Given /^I am logged in as "([^"]*)"$/ do |name|
  user = Factory(:user, :name => name)
  Given %{I log in with email "#{user.email}" and password "#{user.password}"}
end

Then /^I should be logged in as "([^\"]*)"$/ do |name|
  Then %{I should not see "Ça faut un compte pour écrire un article."}
  And %{I should see "Salut #{name}"}
end
