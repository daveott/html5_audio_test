require 'spec_helper'

describe Artist do
  describe "#full_name" do
    let(:artist) do
      Fabricate.build(
        :artist,
        first_name: first_name,
        last_name: last_name
      )
    end

    subject { artist.full_name }

    context "with a first and last name" do
      let(:first_name) { "Miles" }
      let(:last_name) { "Davis" }
      it { should == "Miles Davis" }
    end

    context "with only a first name" do
      let(:first_name) { "Miles" }
      let(:last_name) { "" }
      it { should == "Miles" }
    end

    context "with only a last name" do
      let(:first_name) { "" }
      let(:last_name) { "Davis" }
      it { should == "Davis" }
    end
  end
end
