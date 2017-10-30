class CreateTransactionFormFields < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_form_fields do |t|
      t.references :transaction_forms
      t.references :fields

      t.timestamps
    end
  end
end
