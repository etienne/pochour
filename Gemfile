source 'http://rubygems.org'

gem 'rails', '3.2.0'
gem 'rake'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem "devise"
gem "cancan"
gem "friendly_id", "~> 4.0.1"
gem "simple_form"
gem 'will_paginate', '~> 3.0'

# Asset template engines  
group :assets do
  gem 'sass-rails',   :git => 'git://github.com/rails/sass-rails.git', :branch => '3-2-stable'
  gem 'coffee-rails', :git => 'git://github.com/rails/coffee-rails.git', :branch => '3-2-stable'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
end
  
gem 'jquery-rails'  

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
gem 'nokogiri'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for certain environments:

group :test, :development do
  gem "rspec-rails", "~> 2.6"
end

group :test do
  gem "shoulda-matchers"
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'launchy'
  gem 'factory_girl_rails'
end
