class CreateMultiSpecBarCharts < ActiveRecord::Migration
  def change
    create_table :multi_spec_bar_charts do |t|
      t.integer :MultiSpecSample_id
      t.String :barchart_png_filespec
      t.string :bar
      t.binary :chart_png_image

      t.timestamps null: false
    end
  end
end
