class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :title
      t.text :content
      t.references :user

      t.timestamps
    end
    add_index :notices, :user_id
  end
end
