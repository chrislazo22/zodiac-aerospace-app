class AddDetailsToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :test_plan_search, :string
    add_column :searches, :cushion_search, :string
    add_column :searches, :seat_model_search, :integer
  end
end
