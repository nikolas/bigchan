require 'spec_helper'

describe Bigup do
  before(:each) do
    @attr = {
      :name => "value for name",
      :title => "value for title",
      :content => "value for content"
    }
  end

  it "should create a new instance given valid attributes" do
    Bigup.create!(@attr)
  end
end
