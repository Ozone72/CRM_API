class AddPasswordToAuths < ActiveRecord::Migration[5.1]
  def change
    add_column :auths, :password, :string
    add_reference :auths, :user, foreign_key: true
  end
end
