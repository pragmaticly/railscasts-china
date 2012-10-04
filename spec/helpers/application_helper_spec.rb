require 'spec_helper'

describe ApplicationHelper do
  context "#meta_tag" do
    it "should return meta tag" do
      helper.meta_tag("foo", "bar").should == %q!<meta name="foo" content="bar"/>!
    end
  end

  context "#time_tag" do
    it "should return time tag" do
      time = Time.new(2012, 07, 27, 0, 0, 0, "+08:00")
      helper.time_tag(time).should == %q!<time datetime="2012-07-27 00:00:00 +0800">July 27, 2012</time>!
    end
  end

  context "#textilize" do
    let(:text) { "to be textilize" }
    it "should textilize the text" do
      CodeFormatter.should_receive(:new).with(text).and_return(text)
      text.should_receive(:to_html).and_return(text)
      helper.textilize(text)
    end
  end
end
