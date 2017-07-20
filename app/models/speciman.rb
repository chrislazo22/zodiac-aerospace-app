class Speciman < ActiveRecord::Base
  def self.search(search)
    Speciman.where("test_plan LIKE ?" "%#{search}%")
  end
end
