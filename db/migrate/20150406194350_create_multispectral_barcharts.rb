class CreateMultispectralBarcharts < ActiveRecord::Migration
  def change
    create_table :multispectral_barcharts do |t|
      t.string :barchart_png_filename
      t.binary :barchart_png_image
      t.string :upload_status
      t.references :multispectral_sample, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
