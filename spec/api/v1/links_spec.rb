#!/bin/env ruby
# encoding: utf-8
require 'spec_helper'

describe API::V1::Links do
  include Rack::Test::Methods

  def app
    API::V1::Links
  end

  before { app.before { env['api.tilt.root'] = 'app/api/views' } }

  before(:all) do
    (1..3).to_a.each do |n|
      FactoryGirl.create :link, shorten: "short#{n}"
    end
  end

  describe "GET /v1/links" do

    it "returns all links" do
      get "/v1/links"

      expect(last_response.status).to match 200

      expect(hash_response_body).not_to be nil
      expect(hash_response_body.size).to match 3
    end

  end

end
