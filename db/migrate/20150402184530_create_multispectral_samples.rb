class CreateMultispectralSamples < ActiveRecord::Migration
  def change
    create_table :multispectral_samples do |t|
      t.string :multispectral_sample_semantic_id
      t.string :manifest
      t.string :canvas
      t.integer :x
      t.integer :y
      t.string :wavelength
      t.string :reflectance
      t.boolean :normalized
      t.string :creating_application
      t.string :creating_application_version
      t.text :comment
      t.string :exr_file_name
      t.string :user
      t.integer :profile_id
      t.string :upload_status

      t.timestamps null: false
    end
  end
end
