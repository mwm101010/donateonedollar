class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    if @contact.invalid?
    flash[:error] = 'Could not save! Data is invalid.'
    end
    redirect_to root_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone_number, :message)
  end

end
