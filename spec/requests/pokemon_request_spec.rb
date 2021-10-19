require "rails_helper"

RSpec.describe Pokemon, type: :request do
  let!(:pokemons) {create_list(:pokemon, 10)}
  let!(:pokemon_id) {pokemons.first.id}
  describe "GET /pokemons" do
    context "when result not empty" do
      before { get '/api/v1/pokemons'}
      it "returns pokemons" do
        expect(json).not_to be_empty
        expect(json["data"].size).to eq(10)
      end
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end
    context "when result empty" do
      let(:pokemons) {[]}
      let(:pokemon_id){}
      before {get "/api/v1/pokemons"}
      it "returns pokemons" do
        expect(json["data"]).to be_empty
        expect(json["data"].size).to eq(0)
      end
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST /pokemons" do
    let(:valid_params) { {
      name: "Pikachu",
      description: "description",
      height: 50,
      weight: 30,
      skill: "push power",
      image: "image link"
    }}
    let(:invalid_params){{
      description: "description",
      height: 50,
      weight: 30,
      skill: "push power",
      image: "image link"
    }}
    context "when the request is valid" do
      before { post '/api/v1/pokemons', params: valid_params}
      it "created pokemons" do
        expect(json).not_to be_empty
      end
      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end
    context "when the request is invalid" do
      before {post '/api/v1/pokemons', params: invalid_params}
      it "return status code 422" do
        expect(response).to have_http_status(422)
      end
      it "return messages validate failure" do
        expect(json["name"]).to include("can't be blank")
      end
    end
  end
  
  describe "DELETE /pokemons/:pokemon_id" do
    before {delete "/api/v1/pokemons/#{pokemon_id}"}
    it "return status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end