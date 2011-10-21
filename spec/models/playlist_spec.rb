require 'spec_helper'

describe Playlist do
  let!(:joe_henry) { Fabricate(:artist, first_name: "Joe", last_name: "Henry") }
  let!(:joe_pug) { Fabricate(:artist, first_name: "Joe", last_name: "Pug") }
  let(:order) { "artist_name" }

  let(:playlist) { Playlist.new(order) }

  before do
    Fabricate(:mp3, title: "Civilians", artist: joe_henry)
    Fabricate(:mp3, title: "Unsophisticated Heart", artist: joe_pug)
  end

  describe ".compose" do
    let(:playlist) { mock("playlist") }
    subject { Playlist.compose(order) }

    before do
      Playlist.stub(:new).and_return(playlist)
      Playlist.should_receive(:new).with(order).and_return(playlist)
      playlist.should_receive(:compose!).and_return("#EXTM3U")
    end

    it { should == "#EXTM3U" }
  end

  describe "#compose!" do
    subject { playlist.compose! }
    it "returns an m3u formatted string" do
      subject.should include("#EXTM3U\n#EXTINF")
    end
  end

  describe "#header" do
    subject { playlist.header }
    it { should == "#EXTM3U" }
  end

  describe "#mp3s" do
    subject { playlist.mp3s }
    its(:count) { should == 2 }
    it { should be_a(ActiveRecord::Relation) }
  end

  describe "#parts" do
    subject { playlist.parts }
    before do
      playlist.stub(:mp3s).and_return(["1", "2"])
      playlist.should_receive(:mp3s).once
    end
    it { should == ["#EXTM3U", "1", "2"] }
  end
end
