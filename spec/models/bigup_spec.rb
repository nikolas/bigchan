require 'spec_helper'

describe Bigup do
  before(:each) do
    @bigup = Factory(:bigup)
  end

  it "should create a new instance given valid attributes" do
    Bigup.create!(@attr)
  end

  it "should have a spool attribute" do
    @bigup.should respond_to(:spool_id)
  end
end
