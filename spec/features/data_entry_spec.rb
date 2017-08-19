require 'rails_helper'

describe 'data entry page' do
  before do 
    @user = @user = User.create(email: "user@user.com", password: "asdfasdf", admin: true)
    login_as(@user, :scope => :user)
    visit data_entry_path
  end
  
  before do 
    @speciman = Speciman.create(pass_or_fail: "pass", test_plan: "4FR4132-12-FA1", cushion: "Back and Bottom", test_plan_id: "1", seat_model: 4132, test_date: Date.today, vert_burn_length_front: 4.8, vert_burn_length_back: 0.0, horiz_burn_length_top: 5.2, horiz_burn_length_bottom: 9.5, weight_loss_percent: 8.23, weight_loss_lbs: 0.42, cover_config: "Fully Encapsulated", foam_a_material: "DAX 45 Polyurethane", foam_a_percent: 100.00, decorative_insulation_part_number: "71000", decorative_insulation_mfr: nil, backing: nil, adhesive_one: "Simalfa 309", adhesive_two: nil, fireblock_part_number: "413")
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
      
       # refactor later
    end
  end
  
  describe 'show' do 
    it 'links to show page index' do 
      visit specimen_path
      click_link('4FR4132-12-FA1')
      
      expect(page).to have_content('4FR4132-12-FA1')
    end
  end
  
  describe 'edit' do
    it 'allows admin to edit the material page' do 
      visit edit_speciman_path(@speciman)
      
      fill_in 'speciman[test_plan]', with: "4FR4132-12-FA1"
      click_on "Submit"
      
      visit specimen_path
      expect(page).to have_content("4FR4132-12-FA1")
    end
  end
  
  describe 'delete' do 
    it 'can be deleted' do 
      visit speciman_path(@speciman)
      
      click_link('Delete Material')
      expect(page.status_code).to eq(200)
    end
  end
      
  
  describe 'search function' do
    before do 
      visit search_path
    end
    
    it 'has a search bar' do
      find_field('Search').value
    end
    
    it 'outputs a value' do 
      fill_in :search, with: "4FR4114-12"
      click_button('Search')
      
      expect(page).to have_content("4FR4114-12")
    end
  end
end