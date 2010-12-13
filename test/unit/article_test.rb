require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  should belong_to(:user)
  should have_many(:comments)
  should have_and_belong_to_many(:epithets)

  should validate_presence_of(:title)
  should validate_presence_of(:article)
  
  context "An article without a subtitle" do
    setup do
      @article = Factory(:article, :title => "Salut les jeune")
    end

    should "return its full title when sent #display_title" do
      assert_equal @article.display_title, "Salut les jeune"
    end
    
    should "return nil when sent #subtitle" do
      assert_nil @article.subtitle
    end
    
    should "return false when sent #subtitle?" do
      assert_equal @article.subtitle?, false 
    end
  end
  
  context "An article with a subtitle" do
    setup do
      @article = Factory(:article, :title => "Salut les jeune: un article fucked up: vraiment")
    end
    
    should "return only the title when sent #display_title" do
      assert_equal @article.display_title, "Salut les jeune"
    end
    
    should "return only the subtitle when sent #subtitle" do
      assert_equal @article.subtitle, "un article fucked up: vraiment"
    end
    
    should "return true when sent #subtitle?" do
      assert_equal @article.subtitle?, true
    end
  end
end
