require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do
  describe "campaigns#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
      end
  end

   describe "campaigns#new action" do
    it "should successfully show the new form" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "campaigns#create" do
    it "should successfully create a campaign in the database" do
      post :create, params: {campaign: {title: 'hunger', description_short: 'can you do it', description_full: 'There are so many in the world who just eat one meal per day', goal: '10000', raised: '2413'}}
      expect(response).to redirect_to root_path

      campaign = Campaign.last
      expect(campaign.title).to eq("hunger")
    end
  end

  describe "campaigns#show action" do
    it "should successfully load the show page" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
