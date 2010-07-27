require 'spec_helper'

describe PagesController do
  integrate_views

  before(:each) do
    @bigup = Factory(:bigup)

    @bigups = [@bigup]
    30.times do
      @bigups << Factory(:bigup)
    end
  end

  describe "GET 'home'" do
    before(:each) do
      get :home
    end

    it "should be successful" do
      response.should be_success
    end

    it "should have the right title" do
      response.should have_tag("title", /bigchan/i)
    end

    it "should have an element for each thread" do
      get :home
      @bigups.each do |bigup|
        response.should have_tag("td", bigup.title)
      end
    end
  end

end
