class CreateFields < ActiveRecord::Migration[5.1]
  def change
    create_table :fields do |t|
      t.string :input_name
      t.string :input_type
      t.string :width
      t.string :rows
      t.string :value
      t.timestamps
    end
  end
end
