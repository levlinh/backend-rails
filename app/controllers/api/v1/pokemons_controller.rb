class Api::V1::PokemonsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    pokemons = Pokemon.all.includes(:categories)
    unless pokemons.empty?
      render json: {
        status: {code: 200, message: "All pokemon."},
        data: PokemonSerializer.new(pokemons, each_serializer: CategorySerializer)
      }, status: :ok
    else
      render json: {
        status: {message: "No pokemon."}
      }, status: :no_content
    end
  end

  def destroy
    pokemon = Pokemon.find(params[:id])
    byebug
    if pokemon.delete
      render json: {
        status: {code: 200, message: "Delete pokemon successfully."}
      }, status: :ok
    else
      render json: {
        status: {message: "Delete pokemon failed."}
      }, status: :no_content
    end
  end
end