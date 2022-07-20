require "rails_helper"

RSpec.describe "Users:", type: :request do
  describe "POST /api/v1/user" do
    it "can create an user" do
      fake_email = "fake_name@gmail.com"
      post "/api/v1/user", params: { email: "fake_name@gmail.com" }
      p JSON.parse response.body
      expect(response).to have_http_status 200
    end
  end
end
