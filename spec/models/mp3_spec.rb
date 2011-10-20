require 'spec_helper'

describe Mp3 do
  it { should belong_to(:artist) }
  it { should validate_presence_of(:title) }
end
