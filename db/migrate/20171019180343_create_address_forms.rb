class CreateAddressForms < ActiveRecord::Migration[5.1]
  def change
    create_table :address_forms do |t|
      t.references :forms

      t.timestamps
    end
  end
end
