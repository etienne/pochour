require 'spec_helper'

describe Epithet do
  before do
    Factory(:epithet)
  end
  
  it { should have_many(:epithet_votes) }
  it { should have_many(:users).through(:epithet_votes) }
  it { should have_and_belong_to_many(:articles) }

  it { should validate_uniqueness_of(:name).case_insensitive }
end
