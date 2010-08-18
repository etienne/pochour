Given /^I have an article titled "([^"]*)" with author "([^"]*)"$/ do |title, author|
  Factory(:article,
    :title => title,
    :user => User.find_by_name(author)
  )
end
