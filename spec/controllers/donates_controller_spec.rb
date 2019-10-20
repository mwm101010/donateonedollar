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
      post :create, params: {donates: {campaign_title: 'hunger', donation_amount: '5', full_name: 'mahesha', email: 'ma.muthukuda@gmail.com', phone_number: '9366689805'}}
      expect(response).to redirect_to root_path

      donate = Donate.last
      expect(donate.campaign_title).to eq("hunger")
      
    end
  end

end
