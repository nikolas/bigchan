require 'spec_helper'

describe Spool do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    Spool.create!(@valid_attributes)
  end
end
