class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.text :email
      t.integer :phone_number
      t.text :message
      t.timestamps
    end
  end
end
