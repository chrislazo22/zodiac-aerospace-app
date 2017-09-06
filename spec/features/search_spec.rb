require 'rails_helper'

describe 'search' do
  before do
    @user = User.create(email: "user@user.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "User", last_name: "1", admin: true)
    login_as(@user, :scope => :user)
    visit admin_dashboard_path
  end
  
  describe 'simple serach' do 
    
    it 'simple search page can be found' do 
      visit '/search'
      
      expect(page.status_code).to eq(200)
    end
    
    it 'has link to advanced search' do 
      visit simple_search_path
      
      expect(page).to have_content("Advanced Search")
    end
  end
  
  describe 'advanced search function' do 
    it 'advanced search can be reached' do 
      visit new_search_path
      
      expect(page.status_code).to eq(200)
    end
    
    it 'outputs a value' do 
      visit new_search_path
      
      fill_in 'speciman[test_plan]', with: "4FR4114-12"
      click_button('Search')
      
      expect(page).to have_content("4FR4114-12")
    end
  end
end
