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
  end
end