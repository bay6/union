class AddCategoryToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :category, :string
  end
end
