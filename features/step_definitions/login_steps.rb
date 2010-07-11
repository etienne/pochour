Given /^I am not logged in$/ do
  Given "I am on the logout page"
end

Given /^I have one\s+user "([^\"]*)" with email "([^\"]*)" and password "([^\"]*)"$/ do |name, email, password|
  User.new(:email => email,
           :name => name,
           :password => password,
           :password_confirmation => password).save!
end

Given /^I am a new, logged in user$/ do
  email = 'john@example.com'
  name = 'John Example'
  password = 'tropcool'

  Given %{I have one user "#{name}" with email "#{email}" and password "#{password}"}
  And %{I go to the home page}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Connexion"}
end
