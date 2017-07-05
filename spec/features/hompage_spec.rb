require 'rails_helper'

describe 'homepage' do 
  describe 'navigation' do 
    before do 
      @user = User.create(email: "user@user.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "User", last_name: "1")
      login_as(@user, :scope => :user)
      visit root_path
    end
    
    it 'can be reached successfully' do 
      expect(page.status_code).to eq(200)
    end
    
    it 'has the correct links' do 
      visit root_path
      
      expect(page).to have_content('Search')
      expect(page).to have_content('Data Entry')
    end
  end
end
