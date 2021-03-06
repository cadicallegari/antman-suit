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
      FactoryGirl.create :link, shortcode: "short#{n}"
    end
  end

  describe "GET /links" do

    it "returns all links" do
      get "/links"

      expect(last_response.status).to match 200

      expect(hash_response_body).not_to be nil
      expect(hash_response_body.size).to match 3
    end

  end

  describe "POST /shorten" do

    let(:build_link) { FactoryGirl.build(:link) }
    let(:my_shortcode)  { "000000" }

    it "create a new link" do
      params = {
        url: build_link.url,
        shortcode: my_shortcode
      }.to_json

      post "/shorten", params, base_headers

      # puts hash_response_body
      expect(last_response.status).to match 201

      expect(hash_response_body["shortcode"]).not_to be nil
      expect(hash_response_body["shortcode"]).to match my_shortcode
    end


    it "url not present" do
      params = {
        shortcode: build_link.shortcode
      }.to_json

      post "/shorten", params, base_headers

      # puts hash_response_body
      expect(last_response.status).to match 400

      expect(hash_response_body["error"]).not_to be nil
    end

    it "unavaliable shortcode" do
      params = {
        url: build_link.url,
        shortcode: 'short1'
      }.to_json

      post "/shorten", params, base_headers

      # puts hash_response_body
      expect(last_response.status).to match 409

      expect(hash_response_body["error"]).not_to be nil
    end

    it "invalid shortcode" do
      params = {
        url: build_link.url,
        shortcode: "#3!123?::"
      }.to_json

      post "/shorten", params, base_headers

      # puts hash_response_body
      expect(last_response.status).to match 422

      expect(hash_response_body["error"]).not_to be nil
    end

  end


  let(:url) { "http://www.google.com" }
  let(:code) { "google" }
  let(:build_link) { FactoryGirl.create(:link, url: url, shortcode: code) }

  describe "GET /:code" do

    it "returns all links" do
      build_link

      get "/#{code}"

      expect(last_response.status).to match 302

      expect(last_response.headers["Location"]).to match url
    end
  end


  describe "GET /:code/stats" do

    it "returns all links" do
      build_link

      get "/#{code}/stats"
      expect(hash_response_body["redirectCount"]).to match 0
      expect(hash_response_body["startDate"]).not_to be_nil
      expect(hash_response_body["lastSeenDate"]).to be_nil

      get "/#{code}"
      get "/#{code}/stats"
      expect(hash_response_body["redirectCount"]).to match 1
      expect(hash_response_body["startDate"]).not_to be_nil
      expect(hash_response_body["lastSeenDate"]).not_to be_nil

      get "/#{code}"
      get "/#{code}/stats"
      expect(hash_response_body["redirectCount"]).to match 2
      expect(hash_response_body["startDate"]).not_to be_nil
      expect(hash_response_body["lastSeenDate"]).not_to be_nil
    end
  end



end
