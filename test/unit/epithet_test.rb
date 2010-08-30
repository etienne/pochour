require 'test_helper'

class EpithetTest < ActiveSupport::TestCase
  should have_many(:epithet_votes)
  should have_many(:articles).through(:epithet_votes)
end
