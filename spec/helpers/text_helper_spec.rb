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
  end
end
