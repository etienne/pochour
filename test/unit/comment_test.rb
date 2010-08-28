require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  should belong_to(:article)
  should belong_to(:user)
  should validate_presence_of(:comment)
end
