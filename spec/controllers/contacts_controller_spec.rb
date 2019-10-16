require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe "contacts#new action" do
    it "should successfully show the page" do
      get :new
      expect(response).to have_http_status(:success)
      end
  end

end
