# encoding: UTF-8

require 'spec_helper'

describe TextHelper do
  describe "#truncate_html" do
    before do
      @string = "<p>Première phrase.<br />Premier paragraphe.</p><p>Deuxième élément.<br />Saut de ligne.<br />Troisième saut de ligne.</p>"
    end
    
    it "returns the first paragraph" do
      truncate_html(@string, 35).should eq("<p>Première phrase.<br>Premier paragraphe.</p>")
    end

    it "returns everything until the third line break" do
      truncate_html(@string, 70).should eq("<p>Première phrase.<br>Premier paragraphe.</p><p>Deuxième élément.<br>Saut de ligne.</p>")
    end

    it "returns the first sentence" do
      truncate_html(@string, 18).should eq("<p>Première phrase.</p>")
    end

    it "returns part of a sentence" do
      truncate_html(@string, 9).should eq("<p>Première phr...</p>")
    end
    
    it "returns the original text" do
      truncate_html("Fucké raide là", 14).should eq("Fucké raide là")
    end
    
    it "returns the original HTML" do
      truncate_html("<p>Je trippe!</p>", 80).should eq("<p>Je trippe!</p>")
    end
    
    it "translates entities to proper accents" do
      truncate_html("<p>J&eacute;sus t&rsquo;aime!</p>", 80).should eq("<p>Jésus t’aime!</p>")
    end
  end
end
