class Search < ApplicationRecord
  has_many :specimen

  def specimen
    @specimen ||= find_specimen
  end

  private

  def find_specimen
    specimen = Speciman.order(:test_plan)
    specimen = specimen.where("test_plan like ?", "%#{test_plan_search}%") if test_plan_search.present?
    specimen = specimen.where("cushion like ?", "%#{cushion_search}%") if cushion_search.present?
    specimen = specimen.where("seat_model like ?", "%#{seat_model_search}%") if seat_model_search.present?
    specimen = specimen.where("foam_a_material like ?", "%#{foam_a_material_search}%") if foam_a_material_search.present?
    specimen = specimen.where("foam_b_material like ?", "%#{foam_b_material_search}%") if foam_b_material_search.present?
    specimen = specimen.where("fireblock_type like ?", "%#{fireblock_type_search}%") if fireblock_type_search.present?
    specimen = specimen.where("fireblock_part_number like ?", "%#{fireblock_part_number_search}%") if fireblock_part_number_search.present?
    specimen = specimen.where("flame_treatment like ?", "%#{flame_treatment_search}%") if flame_treatment_search.present?

    specimen
  end
end
