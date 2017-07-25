class Speciman < ActiveRecord::Base
  
  def self.search(search)
    if search
      find(:all, :conditions => ['test_plan LIKE ?', "%#{params[:search]}%"])
    end
  end
end
