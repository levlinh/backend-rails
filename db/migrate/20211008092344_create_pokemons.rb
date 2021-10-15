class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.text :description
      t.integer :height
      t.integer :weight
      t.integer :gender
      t.string :skill
      t.string :image

      t.timestamps
    end
  end
end
