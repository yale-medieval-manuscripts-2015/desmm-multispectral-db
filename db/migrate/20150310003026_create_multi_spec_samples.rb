class CreateMultiSpecSamples < ActiveRecord::Migration
  def change
    create_table :multi_spec_samples do |t|
      t.integer :MultiSpecSample_id
      t.string :manifest
      t.string :manifest
      t.string :canvas
      t.integer :x
      t.integer :y
      t.integer :wavelength
      t.integer :reflectance
      t.boolean :normalized
      t.string :creatingApplication
      t.string :creatingApplication
      t.text :comment
      t.string :exrFileName
      t.string :user
      t.datetime :createdOn
      t.integer :profileID

      t.timestamps null: false
    end
  end
end
