require 'spec_helper'

describe Episode do
  subject { create(:episode) }
  it { should belong_to(:user)}
  it { should validate_presence_of :name }
  it { should validate_presence_of :permalink }
  it { should validate_presence_of :description }
  it { should validate_presence_of :notes }

  describe "Scope" do
    describe ".by_tag" do
      before do
        @episode1 = create(:episode)
        @episode2 = create(:episode)
        @episode1.tags << Tag.create(name: "activerecord")
        @episode2.tags << Tag.create(name: "activemodel")
      end

      it "should filter the episode by tag_name" do
        Episode.by_tag('activemodel').all.should == [@episode2]
      end

      it "should return all records if tag_name is nil" do
        Episode.by_tag(nil).count.should == 2
      end
    end
  end

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

    describe "#add_tags!" do
      it "should create Tag" do
        expect do
          episode.tag_list = "new"
        end.to change(Tag, :count).by(1)
      end

      it "should spilt the tag string" do
        tags_string = "activerecord, 3.0"
        episode.tag_list = tags_string
        episode.tags.collect(&:name).include?('activerecord').should be_true
        episode.tags.collect(&:name).include?('3.0').should be_true
      end

      it "should not duplicate the tags" do
        tags_string = "activerecord, activerecord"
        episode.tag_list = tags_string
        episode.tags.size.should == 1
      end
    end

  end

end
