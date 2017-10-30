class CreateContactFormFields < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_form_fields do |t|
      t.references :contact_forms
      t.references :fields

      t.timestamps
    end
  end
end
