class Speciman < ActiveRecord::Base
  def self.search(search)
    where("test_plan ILIKE ? OR seat_model ILIKE ?", "%#{search}%", "%#{search}%") 
  end
end
