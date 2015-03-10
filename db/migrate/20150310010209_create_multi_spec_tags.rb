class CreateMultiSpecTags < ActiveRecord::Migration
  def change
    create_table :multi_spec_tags do |t|
      t.string :MultiSpecSample_id
      t.integer :
      t.string :Tag
      t.string :
      t.string :TagValue
      t.string :

      t.timestamps null: false
    end
  end
end
