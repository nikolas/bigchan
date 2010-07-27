require 'spec_helper'

describe BigupsController do
  integrate_views

  before(:each) do
    @bigup = Factory(:bigup)

    30.times do
      @bigups << Factory(:bigup)
    end
  end

  it "should have an element for each thread" do
    get :index
    @bigups.each do |bigup|
      response.should have_tag("td", bigup.title)
    end
  end
end
