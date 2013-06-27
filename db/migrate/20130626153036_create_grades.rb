class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :name
      t.text :description
      t.integer :weights

      t.timestamps
    end
  end
end
