require 'spec_helper'

describe Episode do
  subject { create(:episode) }
  it { should belong_to(:user)}
  it { should validate_presence_of :name }
  it { should validate_presence_of :permalink }
  it { should validate_presence_of :description }
  it { should validate_presence_of :notes }

  describe "Instance Method" do
    let(:episode) { create(:episode, permalink: 13466, seconds: 600) }

    describe "#to_param" do
      it "should a string" do
        episode.to_param.should be_instance_of String
      end

      it "should return the permalink" do
        episode.to_param.should == "13466"
      end
    end

    describe "#minutes" do
      it "should return the minutes of a episode" do
        episode.minutes.should == 10
      end
    end

  end

end
