class AlterDonatesRemoveColumnCampaignId < ActiveRecord::Migration[5.2]
  def change
    remove_column :donates, :campaign_id
  end
end
