Given /^I am not logged in$/ do
  Given "I am on the logout page"
end

Given /^I have one\s+user "([^\"]*)" with email "([^\"]*)" and password "([^\"]*)"$/ do |name, email, password|
  Factory(:user, {
    :email => email,
    :name => name,
    :password => password})
end

Given /^I am a new, logged in user$/ do
  user = Factory(:user)
  Given %{I go to the home page}
  And %{I fill in "user_email" with "#{user.email}"}
  And %{I fill in "user_password" with "#{user.password}"}
  And %{I press "Connectation"}
end

Then /^I should be logged in as "([^\"]*)"$/ do |name|
  Then %{I should not see "Créer un compte"}
  And %{I should see "Salut #{name}"}
end

