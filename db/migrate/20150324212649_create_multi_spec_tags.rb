class CreateMultiSpecTags < ActiveRecord::Migration
  def change
    create_table :multi_spec_tags do |t|
      t.string :multi_spec_sample_id
      t.string :Tag
      t.string :TagValue
      t.string :upload_status

      t.timestamps null: false
    end
  end
end
