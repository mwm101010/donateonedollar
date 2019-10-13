class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaign do |t|
      t.string :title
      t.text :description_short
      t.text :description_full
      t.decimal :goal
      t.decimal :raised
      t.timestamps
    end
  end
end
