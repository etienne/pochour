require 'spec_helper'

describe EpithetVote do
  it { should belong_to(:epithet) }
  it { should belong_to(:user) }
end
