class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def create 
    @campaign = Campaign.create(campaign_params)
    redirect_to root_path
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :description_short, :description_full, :goal, :raised)
  end
end
