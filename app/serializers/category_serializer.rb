class CategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description

  def pokemons
    object.pokemons.map do |pokemon|
      {
        id: pokemon.id,
        name: pokemon.name,
        description: pokemon.description,
        height: pokemon.height,
        weight: pokemon.weight,
        image: pokemon.image,
        gender: pokemon.gender
      }
    end
  end
end