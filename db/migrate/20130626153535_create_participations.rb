class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.references :project
      t.references :user
      t.string :role
      t.string :status

      t.timestamps
    end
    add_index :participations, :project_id
    add_index :participations, :user_id
  end
end
