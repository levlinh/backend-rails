require "rails_helper"

RSpec.describe 'Categories', type: :request do
  let!(:categories) { create_list(:category, 5)}
  let(:valid_params) {
    {
      name: "Fire and Power",
      description: "Description",
      id_parent: 1
    }
  }
  let(:invalid_params){
    {
      name: "",
      description: "Description",
      id_parent: 1
    }
  }
  let!(:category_id) {categories.first.id}

  describe "GET /categories" do
    before { get '/api/v1/categories'}
    it "returns categories" do
      expect(json).not_to be_empty
      expect(json["data"].size).to eq(5)
    end
    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /categories" do
    context "when the request is valid" do
      before {post '/api/v1/categories', params: valid_params}  
      it "created a category" do
        expect(json["data"]["attributes"]["name"]).to eq('Fire and Power')
      end
      it "return status code 201" do
        expect(response).to have_http_status(201)
      end
    end
    context "when the request is invalid" do
      before {post '/api/v1/categories', params: invalid_params}
      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end
      it "returns a validate failure messages" do
        expect(response.body).to include("is too short (minimum is 3 characters)")
      end
    end
  end

  describe "DELETE /categories/:category_id" do
    before {delete "/api/v1/categories/#{category_id}"}
    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end