class Category < ApplicationRecord
  has_many :category_pokemons
  has_many :pokemons, :through => :category_pokemons
end
