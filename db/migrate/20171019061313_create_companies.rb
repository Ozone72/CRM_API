class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :website
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.integer :zip
      t.string :lat
      t.string :long

      t.timestamps
    end
  end
end
