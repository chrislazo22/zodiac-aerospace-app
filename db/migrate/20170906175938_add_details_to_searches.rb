class AddDetailsToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :test_plan_search, :string
    add_column :searches, :cushion_search, :string
    add_column :searches, :seat_model_search, :integer
    add_column :searches, :foam_a_material_search, :string
    add_column :searches, :foam_b_material_search, :string
    add_column :searches, :fireblock_type_search, :string
    add_column :searches, :fireblock_part_number_search, :string
    add_column :searches, :flame_treatment_search, :string
  end
end
