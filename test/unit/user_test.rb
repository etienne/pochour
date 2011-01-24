require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup { Factory(:user) }
  
  should have_many :articles
  
  should validate_uniqueness_of :name

  should allow_value("salut@pochour.com").for(:email)
  should_not allow_value("salut").for(:email)
  should_not allow_value("Roger pouet pouet <salut@pochour.com>").for(:email)

  should allow_value("Roger est un gros cave.").for(:bio)
  should_ensure_length_in_range :bio, 0..300
  
  context "A member" do
    setup do
      @user = Factory(:user)
    end
    
    should "be able to update articles that they own" do
      ability = Ability.new(@user)
      assert ability.can?(:update, Factory(:article, :user => @user))
      assert ability.cannot?(:update, Factory(:article))
    end
  end
end
