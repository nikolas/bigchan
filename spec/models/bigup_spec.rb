require 'spec_helper'

describe Bigup do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :title => "value for title",
      :content => "value for content"
    }
  end

  it "should create a new instance given valid attributes" do
    Bigup.create!(@valid_attributes)
  end
end
