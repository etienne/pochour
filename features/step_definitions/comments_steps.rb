Then /^I should see "([^"]*)" as regular text$/ do |text|
  Then %{I should see "#{text}"}
  Then %{I should not see "#{text}" within "a"}
end

Then /^I should see "([^"]*)" as a link$/ do |text|
  Then %{I should see "#{text}" within "a"}
end
