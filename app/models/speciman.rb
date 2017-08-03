class Speciman < ActiveRecord::Base
  validates_presence_of :cushion
  
  def self.search(search)
    where('test_plan LIKE ? OR cushion LIKE ?', "%#{search}%","%#{search}%" )
  end
end
