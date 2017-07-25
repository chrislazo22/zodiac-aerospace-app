class Speciman < ActiveRecord::Base
  
  def self.search(search)
    where('test_plan LIKE ? OR cushion LIKE ?', "%#{search}%","%#{search}%" )
  end
end
