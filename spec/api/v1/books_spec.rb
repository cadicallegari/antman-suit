#!/bin/env ruby
# encoding: utf-8
require 'spec_helper'

describe API::V1::Books do
  include Rack::Test::Methods

  def app
    API::V1::Books
  end

  before { app.before { env['api.tilt.root'] = 'app/api/views' } }

  before(:all) do
    (1..3).to_a.each do |n|
      FactoryGirl.create :book, title: "book #{n}"
    end
  end

  describe "GET /v1/books" do

    it "returns all book" do
      get "/v1/books"

      expect(last_response.status).to match 200

      expect(hash_response_body).not_to be nil
      expect(hash_response_body.size).to match 3
    end

  end

end
