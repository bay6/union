class CreateActivitiesUsers < ActiveRecord::Migration
  def change
    create_table :activities_users, id: false do |t|
      t.integer :activity_id
      t.integer :user_id
    end
  end
end
