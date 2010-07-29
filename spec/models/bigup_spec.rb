require 'spec_helper'

describe Bigup do
  before(:each) do
    @bigup = Factory(:bigup)
    #@bigup.should_receive(:save_attached_files).and_return(true)
  end

  it "should create a new instance given valid attributes" do
    Bigup.create!(@attr)
  end
end
