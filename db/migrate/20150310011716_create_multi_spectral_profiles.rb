class CreateMultiSpectralProfiles < ActiveRecord::Migration
  def change
    create_table :multi_spectral_profiles do |t|
      t.integer :profileId
      t.integer :NumBands
      t.string :BandRanges
      t.text :notes

      t.timestamps null: false
    end
  end
end
