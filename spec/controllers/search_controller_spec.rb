require 'spec_helper'

describe SearchController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'cars'" do
    it "returns http success" do
      get 'cars'
      response.should be_success
    end
  end

end
