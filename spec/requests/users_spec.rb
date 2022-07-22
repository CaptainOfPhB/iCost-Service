require "rails_helper"

RSpec.describe "Users:", type: :request do
  let(:example_mail) { "example@email.com" }
  let(:create_user) { post "/api/v1/user", params: { email: example_mail } }

  describe "POST /api/v1/user" do
    it "can create an user" do
      expect { create_user }.to change { User.count }.by(1)
      expect(response).to have_http_status 200
      hash_response = JSON.parse(response.body).deep_symbolize_keys
      expect(hash_response).to include(
        errors: nil,
        status: "success",
        data: include(email: example_mail, role: "USER", visible: true),
      )
    end
  end

  describe "DELETE /api/v1/user" do
    it "can delete an user" do
      create_user
      hash_response = JSON.parse(response.body).deep_symbolize_keys
      user_identity = hash_response[:data][:identity]
      user_visible = hash_response[:data][:visible]
      delete "/api/v1/user", params: { identity: user_identity }
      expect(response).to have_http_status 200
      hash_response = JSON.parse(response.body).deep_symbolize_keys
      expect(hash_response[:data]).to include visible: false
    end
    it "should failed if user not found or has been destroyed" do
      # TODO: use factory_bot to create a user
    end
  end
end
