class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.references :project
      t.references :user
      t.string :category

      t.timestamps
    end
    add_index :records, :project_id
    add_index :records, :user_id
  end
end
