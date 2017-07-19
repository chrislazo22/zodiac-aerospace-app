require 'rails_helper'

describe 'data entry page' do 
  describe 'navigation' do 
    
    it 'can be reached sucessfully' do 
      visit "/data_entry"
      expect(page.status_code).to eq(200)
    end
  end
end
