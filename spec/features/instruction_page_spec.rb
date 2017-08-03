require 'rails_helper'

describe 'instruction page' do
  it 'can be reached successfully' do
    visit '/instructions'
    
    expect(page.status_code).to eq(200)
  end
end
