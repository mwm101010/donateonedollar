class DonatesController < ApplicationController

  def new
    @donate = Donate.new
  end

  def create

    # Amount in cents
    @amount = 100

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

    @donate = Donate.create(donate_params)
    redirect_to root_path
    render :new, status: :unprocessable_entity
    rescue Stripe::CardError => e
    flash[:error] = e.message
    end
  

  private

  def donate_params
     params.require(:donate).permit(:campaign_title, :donation_amount, :full_name)
  end
end
