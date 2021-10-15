class Pokemon < ApplicationRecord
  has_many :category_pokemons
  has_many :categories, :through => :category_pokemons

  enum gender: {male: 0, female: 1}
end

