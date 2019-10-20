require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe " pages#show action" do
    it "should successfully show the webpage" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
