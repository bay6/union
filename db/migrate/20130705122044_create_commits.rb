class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.datetime :commit_date
      t.string :committer_email
      t.string :committer_name
      t.string :html_url
      t.string :repository_id
      t.string :sha
      t.datetime :author_date
      t.string :author_name
      t.string :author_email

      t.timestamps
    end
  end
end
