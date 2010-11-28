Given /^there is an approved epithet called "([^"]*)"$/ do |epithet|
  Factory(:epithet, :name => epithet, :approved => true)
end
