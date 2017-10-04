require 'rails_helper'

RSpec.describe SpecimenController, type: :controller do
  describe 'export to excel' do
    before :each do
      get :index, format: :xls
    end
    
    it "generate CSV" do
      expect(response.header['Content-Type']).to include('application/xls')
    end
  end
end