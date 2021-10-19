class Pokemon < ApplicationRecord
  has_many :category_pokemons
  has_many :categories, :through => :category_pokemons

  enum gender: {male: 0, female: 1}

  validates :name, :description, :height, :weight, :skill, :image, presence: true
end

