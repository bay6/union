class AddWeightsAndUserNameAndProjectNameToRecords < ActiveRecord::Migration
  def change
    add_column :records, :weights, :integer
    add_column :records, :user_name, :string
    add_column :records, :project_name, :string
  end
end
