class Category < ApplicationRecord
  has_many :category_pokemons
  has_many :pokemons, :through => :category_pokemons

  validates :name, :description, presence: true, length: {minimum: 3}
end
