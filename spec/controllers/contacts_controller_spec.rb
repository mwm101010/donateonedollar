require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe "contacts#new action" do
    it "should successfully show the page" do
      get :new
      expect(response).to have_http_status(:success)
      end
  end

  describe "contacts#create action" do
    it "should successfully submit the input data to database" do
      post :create, params: {contacts: {name: 'Mahesha', email: 'ma.muthukuda@gmail.com', phone_number: '9366689805', message: 'test message'}} 
      expect(response).to redirect_to new_contact_path
      contact = Contact.last
      expect(contact.name).to eq("Mahesha")
    end

    it "should properly deal with validation errors" do
      contact_count = Contact.count
      post :create, params: {contacts: {name: '', email: '', phone_number: '', message: ''}} 
      expect(response).to have_http_status(:unprocessable_entity)
      expect(contact_count).to eq Contact.count
    end
  end
end
