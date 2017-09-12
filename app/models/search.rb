class Search < ActiveRecord::Base
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
    specimen
  end
end
