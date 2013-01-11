require 'spec_helper'

describe "Rack::Typhoeus::Middleware::ParamsDecoder" do

  before(:all) do
    require "rack/typhoeus"
  end

  let(:app) do
    stub
  end

  let(:env) do
    stub
  end

  let(:klass) do
    Rack::Typhoeus::Middleware::ParamsDecoder
  end

  describe "#call" do
  end

  context "when requesting" do
    let(:response) { Typhoeus.get("localhost:3001", :params => {:x => [:a, :b]}) }

    it "transforms parameters" do
      expect(response.body).to include("query_hash\":{\"x\":[\"a\",\"b\"]}")
    end
  end
end
