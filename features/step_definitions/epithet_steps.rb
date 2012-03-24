Given /^there is an approved epithet called "([^"]*)"$/ do |epithet|
  FactoryGirl.create(:epithet, :name => epithet, :approved => true)
end
