class RemoveEmailFromDonates < ActiveRecord::Migration[5.2]
  def change
    remove_column :donates, :email, :text
  end
end
