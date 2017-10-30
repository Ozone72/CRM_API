class RenamePasswordForAuth < ActiveRecord::Migration[5.1]
  def change
      rename_column :auths, :password, :password_digest
  end
end
