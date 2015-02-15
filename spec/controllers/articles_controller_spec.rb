require 'spec_helper'

describe AriticlesController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'laugh'
      response.should be_success
    end
  end
