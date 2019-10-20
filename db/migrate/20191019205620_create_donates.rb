class CreateDonates < ActiveRecord::Migration[5.2]
  def change
    create_table :donates do |t|
      t.integer :campaign_id
      t.string :campaign_title
      t.decimal :donation_amount
      t.string :full_name
      t.text :email
      t.integer :phone_number
      t.timestamps
    end
    add_index :donates, :campaign_id
  end
end
