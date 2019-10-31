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
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
      expect(gram.user).to eq(user)
    end
  end

  describe "campaigns#create" do
    it "should require users to be logged in" do
      post :create, params: {campaign: {title: 'hunger', description_short: 'can you do it', description_full: 'There are so many in the world who just eat one meal per day', goal: '10000', raised: '2413'}}
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully create a campaign in the database" do
      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: {campaign: {title: 'hunger', description_short: 'can you do it', description_full: 'There are so many in the world who just eat one meal per day', goal: '10000', raised: '2413'}}
      expect(response).to redirect_to root_path

      campaign = Campaign.last
      expect(campaign.title).to eq("hunger")
      expect(gram.user).to eq(user)
    end

    it "should properly deal with validation errors" do
      user = FactoryBot.create(:user)
      sign_in user

      campaign_count = Campaign.count
      post :create, params: {campaign: {title: '', description_short: '', description_full: '', goal: '', raised: ''}}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(campaign_count).to eq Campaign.count
    end

  end

  describe "campaigns#show action" do
    it "should successfully load the show page" do
      campaign = FactoryBot.create(:campaign)
      get :show, params: { title: campaign.title }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the campaign is not found" do
      get :show, params: { title: 'money' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "campaigns#edit action" do
    it "should successfully show the edit form if the campaign is found" do
      campaign = FactoryBot.create(:campaign)
      get :edit, params: { id: campaign.id }
      expect(response).to have_http_status(:success)

    end

    it "should return a 404 error message if the campaign is not found" do
      get :edit, params: { id: 'SWAG' }
      expect(response).to have_http_status(:not_found)

    end
  end

  describe "campaigns#update action" do
    it "should allow users to successfully update campaigns" do
      campaign = FactoryBot.create(:campaign, title: "Need food")
      patch :update, params: { id: campaign.id, campaign: { title: 'No food needed', description_short: 'can you do it', description_full: 'There are so many in the world who just eat one meal per day', goal: '10000', raised: '2413' } }
      expect(response).to redirect_to root_path
      campaign.reload
      expect(campaign.title).to eq "No food needed"
    end

    it "should have http 404 error if the campaign cannot be found" do
      patch :update, params: { id: "hoo", campaign: { title: 'No food needed', description_short: 'can you do it', description_full: 'There are so many in the world who just eat one meal per day', goal: '10000', raised: '2413' } }
      expect(response).to have_http_status(:not_found)
    end

    it "should render the edit form with an http status of unprocessable_entity" do
      campaign = FactoryBot.create(:campaign, title: "Need food")
      patch :update, params: { id: campaign.id, campaign: { title: '', description_short: '', description_full: '', goal: '', raised: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      campaign.reload
      expect(campaign.title).to eq "Need food"

    end
  end

  describe "campaigns#destroy action" do
    it "should allow a user to destroy campaign" do
      campaign = FactoryBot.create(:campaign)
      delete :destroy, params: { id: campaign.id }
      expect(response).to redirect_to root_path

      campaign = Campaign.find_by_id(campaign.id)
      expect(campaign).to eq nil
    end

    it "should return a 404 message if we cannot find a campaign with the id that is specified" do
      delete :destroy, params: { id: 'hoo' }
      expect(response).to have_http_status(:not_found)
    end
  end

end
