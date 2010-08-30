require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  should belong_to(:user)
  should have_many(:comments)
  should have_many(:epithet_votes)
  should have_many(:epithets).through(:epithet_votes)

  should validate_presence_of(:title)
  should validate_presence_of(:article)
end
