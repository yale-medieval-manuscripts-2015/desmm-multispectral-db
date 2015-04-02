class CreateMultispectralBarCharts < ActiveRecord::Migration
  def change
    create_table :multispectral_bar_charts do |t|
      t.string :barchart_png_filename
      t.binary :bar_chart_png_image
      t.string :upload_status
      t.references :multispectral_sample, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :multispectral_bar_charts, :multispectral_samples
  end
end
