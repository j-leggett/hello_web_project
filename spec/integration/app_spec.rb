require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /names" do
    it "returns correct list of names" do

      response = get('/names?names=Julia, Mary, Karim')

      expect(response.body).to eq 'Julia, Mary, Karim'
    end
  end

  context "POST /sort-names" do
    it 'returns correct string of ordered names' do
      
      response = post("/sort-names", names: "Joe,Alice,Zoe,Julia,Kieran")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end
  end

  context "/GET /hello" do
    it "returns hello in html" do
      
      response = get("/hello")
      expect(response.body).to include('<h1>Hello!</h1>')
    end
  end
end

