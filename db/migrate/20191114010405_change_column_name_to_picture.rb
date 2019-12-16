class ChangeColumnNameToPicture < ActiveRecord::Migration[5.2]
  def change
    rename_column :campaigns, :image, :picture
  end
end
