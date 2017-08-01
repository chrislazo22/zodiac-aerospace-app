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
    
    it 'user can be created' do 
      visit admin_path
      click_link ("Create User")
      
      fill_in 'user[first_name]', with: "first"
      fill_in 'user[last_name]', with: "last"
      fill_in 'user[email]', with: "user@user.com:"
      fill_in 'user[password]', with: "asdfasdf"
      fill_in 'user[password_confirmation]', with: "asdfasdf"
      
      click_on "Sign up"
      
      expect(page.status_code).to eq(200)
    end
  end
end
