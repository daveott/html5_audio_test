require 'spec_helper'

describe Mp3 do
  it { should belong_to(:artist) }
  it { should have_many(:ratings) }
  it { should validate_presence_of(:title) }

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
