class CreateMultiSpecBarCharts < ActiveRecord::Migration
  def change
    create_table :multi_spec_bar_charts do |t|
      t.string :multi_spec_sample_id
      t.string :barchart_png_filename
      t.string :bar
      t.binary :chart_png_image
      t.string :upload_status

      t.timestamps null: false
    end
  end
end
