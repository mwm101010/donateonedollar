class Campaign < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :description_short, presence: true
  validates :description_full, presence: true
  validates :goal, presence: true
  validates :raised, presence: true

  mount_uploader :picture, PictureUploader
  
  def cal
     @campaign = Campaign.find_by_id(params[:id])
     @cal1 = (@campaign.raised/@campaign.goal) * 100
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :description_short, :description_full, :goal, :raised, :picture)
  end
end
