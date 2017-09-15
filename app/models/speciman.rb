class Speciman < ActiveRecord::Base
  
  validates :test_plan, presence: true
  validates :cushion, presence: true
  validates :seat_model, presence: true
  validates :foam_a_material, presence: true
  validates :foam_a_percent, presence: true
  validates :fireblock_part_number, presence: true
  
  def self.search(search)
    where('test_plan LIKE ?', "%#{search}%")
  end
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |specimen|
        csv << specimen.attributes.values_at(*column_names)
      end
    end
  end
end

