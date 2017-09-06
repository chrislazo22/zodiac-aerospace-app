require 'rails_helper'

describe 'search bar' do
  before do
    @user = User.create(email: "user@user.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "User", last_name: "1", admin: true)
    login_as(@user, :scope => :user)
    visit admin_dashboard_path
  end
  
  it 'simple search page can be found' do 
    visit '/search'
    
    expect(page.status_code).to eq(200)
  end
  
  it 'has link to advanced search' do 
    visit simple_search_path
    
    click_link "Advanced Search"
    
    expect(page.status_code).to eq(200)
  end
end
