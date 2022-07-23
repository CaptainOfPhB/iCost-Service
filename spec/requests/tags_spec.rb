require "rails_helper"

RSpec.describe "Tags:", type: :request do
  describe "GET /tags" do
    it "can get all tags" do
      user = create :user
      expect {
        tags = create_list :tag, 10, user_id: user.id
      }.to change(Tag, :count).by(10)
      get "/api/v1/tags", params: { user_id: user.id }
      expect(response).to have_http_status(200)
      hash_reponse = JSON.parse(response.body)
      hash_reponse["data"].each do |tag|
        expect(tag["user_id"]).to eq user.id
      end
    end
  end

  describe "POST /tags" do
    it "can create tag" do
      user = create :user
      post "/api/v1/tags", params: { user_id: user.id, label: "test" }
      expect(response).to have_http_status(200)
      hash_response = JSON.parse response.body
      expect(hash_response["data"]["label"]).to eq "test"
      expect(hash_response["data"]["user_id"]).to eq user.id
    end
  end

  describe "PATCH /tags" do
    it "can update tag" do
      user = create :user
      tag = create :tag, user_id: user.id
      patch "/api/v1/tags/#{tag.identity}", params: { label: "test" }
      expect(response).to have_http_status(200)
      hash_response = JSON.parse response.body
      expect(hash_response["data"]["label"]).to eq "test"
      expect(hash_response["data"]["user_id"]).to eq user.id
    end
  end
end
