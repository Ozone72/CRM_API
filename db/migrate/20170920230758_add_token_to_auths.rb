class AddTokenToAuths < ActiveRecord::Migration[5.1]
  def change
    add_column :auths, :token, :string
    add_index :auths, :token, unique: true
  end
end
