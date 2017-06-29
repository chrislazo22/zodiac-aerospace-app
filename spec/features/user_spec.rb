require 'rails_helper'

describe 'sign up' do 
  it 'contains the proper fill in criteria' do 
    visit user_session_path
    click_link ("Sign up")
    
    fill_in 'user[first_name]', with: "first"
    fill_in 'user[last_name]', with: "last"
    fill_in 'user[email]', with: "user@user.com:"
    fill_in 'user[password]', with: "asdfasdf"
    fill_in 'user[password_confirmation]', with: "asdfasdf"
    
    click_on "Sign up"
    
    expect(page.status_code).to eq(200)
  end
end
