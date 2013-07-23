class CreateBadgeUsers < ActiveRecord::Migration
  def change
    create_table :badge_users do |t|
      t.integer :badge_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
