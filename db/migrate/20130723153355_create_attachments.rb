class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file_name
      t.string :content_type
      t.string :file_size
      t.string :attachmentable_type
      t.integer :attachmentable_id
      t.string :attachment

      t.timestamps
    end
  end
end
