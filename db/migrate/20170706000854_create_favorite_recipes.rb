class CreateFavoriteRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_recipes do |t|
      t.references :user, foreign_key: true
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
