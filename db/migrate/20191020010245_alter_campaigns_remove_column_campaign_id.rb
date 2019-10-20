class AlterCampaignsRemoveColumnCampaignId < ActiveRecord::Migration[5.2]
  def change
    remove_column :campaigns, :campaign_id 
  end
end
