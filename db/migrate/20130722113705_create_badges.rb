class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name_zh
      t.string :name_en
      t.integer :award_number, :default => 0 
      t.text :description

      t.timestamps
    end
  end
end
