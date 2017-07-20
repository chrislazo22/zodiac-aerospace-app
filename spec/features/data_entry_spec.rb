require 'rails_helper'

describe 'data entry page' do
  before do 
      @user = @user = User.create(email: "user@user.com", password: "asdfasdf")
      login_as(@user, :scope => :user)
      visit data_entry_path
    end
  describe 'navigation' do 
    it 'can be reached sucessfully' do 
      expect(page.status_code).to eq(200)
    end
    
    it "has the correct links" do 
       find_link('Add New Material').visible?
       find_link('Update Existing Material').visible?
    end
  end
  
  describe 'new' do
    it 'can be reached successfully' do 
      visit data_entry_path
      
      click_link('Add New Material')
      visit new_speciman_path
      
      expect(page.status_code).to eq(200)
    end
    
    it 'allows admin to add new material' do 
      visit new_speciman_path
      
      fill_in 'speciman[test_plan]', with: "4FR4132-00"
      click_on "Submit"
      
      expect(page).to have_content("4FR4132-00")
    end
  end
  
  describe 'edit' do
    before do 
      @speciman = Speciman.create(test_plan: "4FR4132-00")
    end
    
    it 'allows admin to edit the material page' do 
      visit edit_speciman_path(@speciman)
      
      fill_in 'speciman[test_plan]', with: "4FR4132-2"
      click_on "Submit"
      
      expect(page).to have_content("4FR4132-2")
    end
  end
  
  describe 'search function' do 
    it 'has a search bar' do
      visit "/search"
      
      find_field('Search').value
    end
    
    it 'outputs a value' do 
      visit search_path
      
      fill_in :search, with: "4FR4114-12"
      click_button('Search')
      
      expect(page).to have_content("4FR4114-12")
    end
  end
end