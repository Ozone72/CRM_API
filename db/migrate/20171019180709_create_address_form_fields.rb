class CreateAddressFormFields < ActiveRecord::Migration[5.1]
  def change
    create_table :address_form_fields do |t|
      t.references :address_forms
      t.references :fields

      t.timestamps
    end
  end
end
