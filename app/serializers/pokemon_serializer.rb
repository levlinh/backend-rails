class PokemonSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :height, :weight, :image, :gender, :categories

  def categories
    object.categories.map do |category|
      {
        id: category.id,
        name: category.name,
      description: category.description
      }
    end
  end
end
