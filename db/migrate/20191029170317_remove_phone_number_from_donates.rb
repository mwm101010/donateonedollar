class RemovePhoneNumberFromDonates < ActiveRecord::Migration[5.2]
  def change
    remove_column :donates, :phone_number, :integer
  end
end
