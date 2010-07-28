require 'spec_helper'

describe BigupsController do
  integrate_views

  before(:each) do
    @bigup = Factory(:bigup)

    @bigups = [@bigup]
    30.times do
      @bigups << Factory(:bigup)
    end
  end

  describe "GET 'index'" do
    before(:each) do
      get :index
    end

    it "should be successful" do
      response.should be_success
    end

    it "should have the right title" do
      response.should have_tag("title", /bigchan/i)
    end

    it "should show the post form" do
      get :index
      response.should have_tag("div", /title/i)
      response.should have_tag("div", /name/i)
      response.should have_tag("div", /content/i)
    end

    it "should have an element for each thread" do
      get :index
      @bigups.each do |bigup|
        response.should have_tag("span", bigup.title)
        response.should have_tag("span", bigup.name)
        response.should have_tag("span", bigup.content)
      end
    end
  end
end
