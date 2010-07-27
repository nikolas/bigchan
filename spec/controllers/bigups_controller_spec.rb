require 'spec_helper'

describe BigupsController do

  #Delete these examples and add some real ones
  it "should use BigupsController" do
    controller.should be_an_instance_of(BigupsController)
  end


  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
end
