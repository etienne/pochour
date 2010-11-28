require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  should belong_to(:user)
  should have_many(:comments)
  should have_and_belong_to_many(:epithets)

  should validate_presence_of(:title)
  should validate_presence_of(:article)
end
