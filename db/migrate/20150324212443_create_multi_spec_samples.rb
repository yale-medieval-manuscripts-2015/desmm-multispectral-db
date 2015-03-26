class CreateMultiSpecSamples < ActiveRecord::Migration
  def change
    create_table :multi_spec_samples do |t|
      t.string :multi_spec_sample_id
      t.string :manifest
      t.string :canvas
      t.integer :x
      t.integer :y
      t.string :creatingApplication
      t.text :comment
      t.string :exrFileName
      t.string :user
      t.integer :profileID
      t.string :upload_status

      t.timestamps null: false
    end
  end
end
