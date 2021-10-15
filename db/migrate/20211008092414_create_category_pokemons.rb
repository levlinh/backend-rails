class CreateCategoryPokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :category_pokemons do |t|
      t.belongs_to :category
      t.belongs_to :pokemon

      t.timestamps
    end
  end
end
