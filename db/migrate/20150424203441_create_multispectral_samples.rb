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
      t.string :manifest_label
      t.string :canvas_label
      t.string :institution
      t.string :md_date
      t.string :md_provenance
      t.string :md_material
      t.string :md_language

      t.timestamps null: false
    end
  end
end
