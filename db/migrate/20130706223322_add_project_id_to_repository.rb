class AddProjectIdToRepository < ActiveRecord::Migration
  def change
    add_column :repositories, :project_id, :integer
  end
end
