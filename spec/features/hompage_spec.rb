require 'rails_helper'

describe 'homepage' do 
  describe 'navigation' do 
    it 'can be reached successfully' do 
      visit root_path
    end
  end
end
