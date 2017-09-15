require 'rails_helper'

RSpec.describe SpecimenController, type: :controller do
  describe 'export to excel' do
    before do 
      @user = @user = User.create(email: "user@user.com", password: "asdfasdf", admin: true)
      login_as(@user, :scope => :user)
      @speciman = Speciman.create(pass_or_fail: "pass", test_plan: "4FR4132-12-FA1", cushion: "Back and Bottom", test_plan_id: "1", seat_model: 4132, test_date: Date.today, vert_burn_length_front: 4.8, vert_burn_length_back: 0.0, horiz_burn_length_top: 5.2, horiz_burn_length_bottom: 9.5, weight_loss_percent: 8.23, weight_loss_lbs: 0.42, cover_config: "Fully Encapsulated", foam_a_material: "DAX 45 Polyurethane", foam_a_percent: 100.00, decorative_insulation_part_number: "71000", decorative_insulation_mfr: nil, backing: nil, adhesive_one: "Simalfa 309", adhesive_two: nil, fireblock_part_number: "413")  
    end
    
    before :each do
      get :index, format: :csv
    end
    
    it "generate CSV" do
      expect(response.header['Content-Type']).to include 'text/csv'
      expect(response.body).to include('what you expect the file to have')
    end
  end
end
