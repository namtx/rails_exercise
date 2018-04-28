require "rails_helper"

RSpec.describe Api::V1::DevelopersController, type: :request do
  let(:developer){create :developer}
  let(:language){create :language}
  let(:programming_language){create :programming_language}

  context "when developer is not exist" do
    it "should response not_found" do
      get "/api/v1/developers/sample"
      expect(response.status).to eq 404
      expect(json["error"]).to eq "not_found"
    end
  end

  context "when developer is existing and have languages and programming_languages" do
    before do
      developer.languages << language
      developer.programming_languages << programming_language
    end

    it "should response correctly" do
      get "/api/v1/developers/#{developer.id}"
      expect(response.status).to eq 200
      expect(json["id"]).to eq developer.id
      expect(json["email"]).to eq developer.email
      expect(json["languages"].length).to eq 1
      expect(json["languages"].first["code"]).to eq language.code
      expect(json["programming_languages"].length).to eq 1
      expect(json["programming_languages"].first["name"]).to eq programming_language.name
    end
  end
end
