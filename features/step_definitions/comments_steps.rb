Then /^I should see "([^"]*)" as regular text$/ do |text|
  step %{I should see "#{text}"}
  step %{I should not see "#{text}" within a link}
end
