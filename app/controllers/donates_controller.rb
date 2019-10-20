class DonatesController < ApplicationController

  def new
    @donates = Donate.new
  end

  def create

    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'DonateOneDollar Premo',
      currency: 'usd'
    )

  @donates = Donate.create(donate_params)
  redirect_to root_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
    


  end

  private

  def donate_params
     params.require(:donate).permit(:campaign_title, :donation_amount, :full_name, :email, :phone_number)
  end
end
