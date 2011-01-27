require 'spec_helper'

describe Article do
  it { should belong_to(:user) }
  it { should have_many(:comments) }
  it { should have_and_belong_to_many(:epithets) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:article) }
  
  context "with no subtitle" do
    before do
      @article = Factory(:article, :title => "Salut les jeune")
    end

    it "returns its full title when sent #display_title" do
      @article.display_title.should eq("Salut les jeune")
    end
    
    it "returns nil when sent #subtitle" do
      @article.subtitle.should be_nil
    end
    
    it "returns false when sent #subtitle?" do
      @article.subtitle?.should be_false
    end
  end
  
  context "with a subtitle" do
    before do
      @article = Factory(:article, :title => "Salut les jeune: un article fucked up: vraiment")
    end
    
    it "returns only the title when sent #display_title" do
      @article.display_title.should eq("Salut les jeune")
    end
    
    it "returns only the subtitle when sent #subtitle" do
      @article.subtitle.should eq("un article fucked up: vraiment")
    end
    
    it "returns true when sent #subtitle?" do
      @article.subtitle?.should be_true
    end
  end
end