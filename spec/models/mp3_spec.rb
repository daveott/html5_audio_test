require 'spec_helper'

describe Mp3 do
  it { should belong_to(:artist) }
  it { should have_many(:ratings) }
  it { should validate_presence_of(:title) }

  let(:joe_henry) { Fabricate(:artist, first_name: "Joe", last_name: "Henry") }
  let(:joe_pug) { Fabricate(:artist, first_name: "Joe", last_name: "Pug") }
  let!(:unsophisticated_heart) { Fabricate(:mp3, title: "Unsophisticated Heart", artist: joe_pug) }
  let!(:civilians) { Fabricate(:mp3, title: "Civilians", artist: joe_henry, length: 12345) }


  describe ".artist_name" do
    subject { Mp3.artist_name }
    it { should == [civilians, unsophisticated_heart] }
  end

  describe ".rating" do
    subject { Mp3.rating(3) }
    before do
      civilians.ratings << Fabricate(:rating, score: 3)
      unsophisticated_heart.ratings << Fabricate(:rating, score: 2)
    end
    it { should == [civilians] }
  end

  describe "#average_rating" do
    let(:mp3) { Fabricate(:mp3) }
    subject { mp3.average_rating }

    context "1 rating" do
      before do
        mp3.ratings << Fabricate(:rating, score: 5)
      end
      it { should == 5.0 }
    end

    context "3 ratings yielding whole number" do
      before do
        mp3.ratings << Fabricate(:rating, score: 5)
        mp3.ratings << Fabricate(:rating, score: 4)
        mp3.ratings << Fabricate(:rating, score: 3)
      end
      it { should == 4.0 }
    end

    context "5 ratings yielding floating point number" do
      before do
        mp3.ratings << Fabricate(:rating, score: 4)
        mp3.ratings << Fabricate(:rating, score: 3)
        mp3.ratings << Fabricate(:rating, score: 5)
        mp3.ratings << Fabricate(:rating, score: 5)
        mp3.ratings << Fabricate(:rating, score: 5)
      end
      it { should == 4.4 }
    end

    context "no ratings" do
      it { should be_nil }
    end
  end

  describe "#to_s" do
    subject { civilians.to_s }
    it { should == "#EXTINF:12345, Joe Henry - Civilians" }
  end
end
