require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  should belong_to(:user)
  should validate_presence_of(:title)
  should validate_presence_of(:article)
end
