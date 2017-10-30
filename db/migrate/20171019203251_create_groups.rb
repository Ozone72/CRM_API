class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.integer :order
      t.string :title
      t.boolean :status

      t.timestamps
    end
  end
end
