class CreateGroupUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :group_users do |t|
      t.string :order
      t.string :name
      t.string :status
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
