class AlterCampaignsAddCampaignId < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :campaign_id, :integer
  end
end
