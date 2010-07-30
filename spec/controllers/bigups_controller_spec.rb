require 'spec_helper'

describe BigupsController do
  integrate_views

  before(:each) do
    @bigup = Factory(:bigup)

    @bigups = [@bigup]
    30.times do
      @bigups << Factory(:bigup)
    end
    Bigup.should_receive(:paginate).and_return(@bigups.paginate)
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
      response.should have_tag("p", /title/i)
      response.should have_tag("p", /name/i)
      response.should have_tag("p", /comment/i)
    end

    it "should have an element for each thread" do
      get :index
      @bigups.each do |bigup|
        response.should have_tag("td", bigup.title)
        response.should have_tag("td", bigup.name)
        response.should have_tag("td", bigup.content)
      end
    end

    it "should paginate threads" do
      response.should have_tag("div.pagination")
    end

    it "should have the right threads in the right order"
  end

  describe "GET 'show'" do
  end

end
