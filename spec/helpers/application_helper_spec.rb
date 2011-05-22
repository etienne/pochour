# encoding: UTF-8

require 'spec_helper'

describe ApplicationHelper do
  describe "#date_tag" do
    it "outputs a <time> tag with the given date" do
      date_tag(Time.local(2010, 8, 30)).should eq('<time datetime="2010-08-30">30 août 2010</time>')
    end
  end
  
  describe "#date_and_time_tag" do
    it "outputs a <time> tag with the given date and time" do
      date_and_time_tag(Time.local(2010, 8, 30, 10, 20)).should eq('<time datetime="2010-08-30T10:20">2010.08.30 10:20 AM</time>')
    end
  end
end
