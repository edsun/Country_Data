class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :population
      t.decimal :median_age
      t.decimal :life_expectancy
      t.decimal :gross_domestic_product
      t.boolean :mandatory_military_service

      t.timestamps
    end
  end
end
