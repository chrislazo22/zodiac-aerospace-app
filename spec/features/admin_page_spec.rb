require 'rails_helper'

describe 'admin page' do
  before do
    @user = User.create(email: "user@user.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "User", last_name: "1", admin: true)
    login_as(@user, :scope => :user)
    visit admin_path
  end
  
  describe 'navigation' do 
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end
    
    it 'can create user' do 
      click_on("Create User")
      
      visit '/create_user'
      
      expect(page).to have_content("First Name")
    end
  end
end
