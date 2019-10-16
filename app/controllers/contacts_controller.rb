class ContactsController < ApplicationController

  def new
    @contacts = Contact.new

  end
end
