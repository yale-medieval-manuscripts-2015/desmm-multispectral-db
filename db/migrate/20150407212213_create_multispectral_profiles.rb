class CreateMultispectralProfiles < ActiveRecord::Migration
  def change
    create_table :multispectral_profiles do |t|
      t.integer :profile_id
      t.integer :num_bands
      t.string :band_ranges
      t.string :creating_application
      t.string :creating_application_version
      t.text :notes

      t.timestamps null: false
    end
  end
end
