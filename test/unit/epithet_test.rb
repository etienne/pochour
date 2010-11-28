require 'test_helper'

class EpithetTest < ActiveSupport::TestCase
  setup { Factory(:epithet) }

  should have_many(:epithet_votes)
  should have_many(:users).through(:epithet_votes)
  should have_and_belong_to_many(:articles)
  
  should validate_uniqueness_of(:name).case_insensitive
end
