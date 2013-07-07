class AddUserUidToCommit < ActiveRecord::Migration
  def change
    add_column :commits, :user_uid, :string
  end
end
