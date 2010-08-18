require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many :articles
  
  should allow_value("salut@pochour.com").for(:email)
  should_not allow_value("salut").for(:email)
  should_not allow_value("Roger pouet pouet <salut@pochour.com>").for(:email)
end
