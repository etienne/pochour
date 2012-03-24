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

Given /^article "([^"]*)" has an image attached$/ do |title|
  article = Article.find_by_title(title)
  article.image = File.open(File.join(%w(features fixtures test_image.png)))
  article.save!
end

Then /^I should see an image at the top of the article$/ do
  page.should have_css('div.body img')
end

Then /^I should not see an image at the top of the article$/ do
  page.should_not have_css('div.body img')
end
