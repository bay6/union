class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :notice
      t.references :user
      t.string :status

      t.timestamps
    end
    add_index :messages, :notice_id
    add_index :messages, :user_id
  end
end
