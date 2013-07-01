class AddValueToRecords < ActiveRecord::Migration
  def change
    add_column :records, :value, :integer, :default => 0
  end
end
