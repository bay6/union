class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.datetime :start_at
      t.text :summary
      t.integer :status

      t.timestamps
    end
  end
end
