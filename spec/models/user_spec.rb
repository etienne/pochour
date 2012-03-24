require 'spec_helper'

describe User do
  before do
    FactoryGirl.create(:user)
  end
  
  it { should have_many :articles }

  it { should allow_value("salut@pochour.com").for(:email) }
  it { should_not allow_value("salut").for(:email) }
  it { should_not allow_value("Roger pouet pouet <salut@pochour.com>").for(:email) }

  it { should allow_value("Roger est un gros cave.").for(:bio) }
  it { should ensure_length_of(:bio).is_at_most(600) }
  
  context "with role member" do
    before do
      @user = FactoryGirl.create(:user)
    end
    
    it "is able to update articles that they own" do
      ability = Ability.new(@user)
      ability.can?(:update, FactoryGirl.create(:article, :user => @user)).should be_true
      ability.cannot?(:update, FactoryGirl.create(:article)).should be_true
    end
  end
end
