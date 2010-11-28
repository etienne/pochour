require 'test_helper'

class EpithetVoteTest < ActiveSupport::TestCase
  should belong_to(:epithet)
  should belong_to(:user)
end
