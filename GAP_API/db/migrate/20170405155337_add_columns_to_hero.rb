class AddColumnsToHero < ActiveRecord::Migration[5.0]
  def change
  	add_column :heroes, :species, :string
  	add_column :heroes, :abilities, :string
  end
end
