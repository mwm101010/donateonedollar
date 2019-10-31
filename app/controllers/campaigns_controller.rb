class CampaignsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def create 
    @campaign = current_user.campaigns.create(campaign_params)
    if @campaign.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @campaign = Campaign.find_by_id(params[:id])
    return render_not_found if @campaign.blank?
  end

  def edit
    @campaign = Campaign.find_by_id(params[:id])
     return render_not_found if @campaign.blank?
  end

  def update
    @campaign = Campaign.find_by_id(params[:id])
    return render_not_found if @Campaign.blank?

    @campaign.update_attributes(campaign_params)

    if @campaign.valid?
      redirect_to root_path
    else
      return render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @campaign = Campaign.find_by_id(params[:id])
    return render_not_found if @campaign.blank?
    
    @campaign.destroy
    redirect_to root_path
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :description_short, :description_full, :goal, :raised, :picture)
  end

  def render_not_found
    render plain: 'Not Found :(', status: :not_found
  end
end
