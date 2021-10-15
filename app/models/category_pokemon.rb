class CategoryPokemon < ApplicationRecord
  belongs_to :pokemon
  belongs_to :category
end
