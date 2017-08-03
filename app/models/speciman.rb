class Speciman < ActiveRecord::Base
  validates :test_plan, :cushion, :seat_model, :foam_a_material, :foam_a_percent, :fireblock_part_number, presence: { message: "must be given please" }
  
  def self.search(search)
    where('test_plan LIKE ? OR cushion LIKE ?', "%#{search}%","%#{search}%" )
  end
end
