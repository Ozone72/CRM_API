class CreateContactForms < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_forms do |t|
      t.references :forms

      t.timestamps
    end
  end
end
