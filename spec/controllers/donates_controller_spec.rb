require 'rails_helper'

RSpec.describe DonatesController, type: :controller do
  describe "donates#new action" do
    it "Should successfully show load the new form" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "donates#create action" do
    it "should successfully create a data record in database" do
      post :create, params: {donates: {campaign_title: 'hunger', donation_amount: '1', full_name: 'mahesha'}}
      expect(response).to redirect_to root_path

      donate = Donate.last
      expect(donate.campaign_title).to eq("hunger")
    end

    it "should properly deal with validation errors" do
      donate_count = Donate.count
      post :create, params: {donates: {campaign_title: '', donation_amount: '', full_name: ''}}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(donate_count).to eq Donate.count
    end
  end

end
