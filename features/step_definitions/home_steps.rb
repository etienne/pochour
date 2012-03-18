When /^I select "([^"]*)" from the users list$/ do |user|
  select(user, :from => 'user_id')
end