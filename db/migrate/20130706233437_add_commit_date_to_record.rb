class AddCommitDateToRecord < ActiveRecord::Migration
  def change
    add_column :records, :commit_date, :date
  end
end
