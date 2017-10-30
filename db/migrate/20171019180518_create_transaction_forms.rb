class CreateTransactionForms < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_forms do |t|
      t.references :forms
      t.references :users

      t.timestamps
    end
  end
end
