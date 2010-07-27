require 'spec_helper'

describe PagesController do
  integrate_views

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
  end

end
