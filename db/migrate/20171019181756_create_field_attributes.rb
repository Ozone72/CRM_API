class CreateFieldAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :field_attributes do |t|
      t.string :attribute
      t.references :fields

      t.timestamps
    end
  end
end
