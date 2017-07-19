class CreateSpecimen < ActiveRecord::Migration
  def change
    create_table :specimen do |t|
      t.string :pass_or_fail
      t.string :test_plan
      t.string :cushion
      t.string :test_plan_id
      t.integer :seat_model
      t.date :test_date
      t.decimal :vert_burn_length_front
      t.decimal :vert_burn_length_back
      t.decimal :horiz_burn_length_top
      t.decimal :horiz_burn_length_bottom
      t.decimal :weight_loss_lbs
      t.decimal :weight_loss_percent
      t.string :cover_config
      t.string :foam_a_material
      t.decimal :foam_a_percent
      t.string :foam_b_material
      t.decimal :foam_b_percent
      t.string :foam_c_material
      t.decimal :foam_c_percent
      t.string :foam_d_material
      t.decimal :foam_d_percent
      t.string :foam_e_material
      t.decimal :foam_e_percent
      t.string :decorative_insulation_part_number
      t.string :decorative_insulation_mfr
      t.string :backing
      t.string :adhesive_one
      t.string :adhesive_two
      t.string :fireblock_type
      t.string :fireblock_part_number
      t.string :fireblock_color
      t.string :fireblock_mfr
      t.string :flame_treatment
      t.decimal :fireblock_percent
      t.string :thermoplastic_part_number
      t.string :thermoplastic_mfr

      t.timestamps null: false
    end
  end
end
