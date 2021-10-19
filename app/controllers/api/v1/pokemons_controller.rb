class Api::V1::PokemonsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_pokemon, only: :destroy

  def index
    @pokemons = Pokemon.all.includes(:categories)
    unless @pokemons.empty?
      render json: PokemonSerializer.new(@pokemons, each_serializer: CategorySerializer), status: :ok
    else
      render json: PokemonSerializer.new(@pokemons, each_serializer: CategorySerializer), status: :ok
    end
  end

  def create
    @pokemon = Pokemon.create(pokemon_params)
    if @pokemon.save
      render json: PokemonSerializer.new(@pokemon), status: :created
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @pokemon.delete
      render json: {
        status: {code: 200, message: "Delete pokemon successfully."}
      }, status: :ok
    else
      render json: {
        status: {message: "Delete pokemon failed."}
      }, status: :no_content
    end
  end

  private
  def pokemon_params
    params.permit(:name, :description, :height, :weight, :skill, :image)
  end
  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end