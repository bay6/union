class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :avatar_url
      t.string :description
      t.string :html_url
      t.string :name
      t.string :starred_url
      t.string :uid

      t.timestamps
    end
  end
end
