Given /^there is an article titled "([^"]*)" with author "([^"]*)"$/ do |title, author|
  # Assumes author has already been defined
  FactoryGirl.create(:article,
    :title => title,
    :user => User.find_by_name(author)
  )
end

Given /^there is an article titled "([^"]*)"$/ do |title|
  FactoryGirl.create(:article, :title => title)
end
