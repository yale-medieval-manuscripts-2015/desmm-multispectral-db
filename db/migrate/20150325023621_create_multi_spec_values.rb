class CreateMultiSpecValues < ActiveRecord::Migration
  def change
    create_table :multi_spec_values do |t|
      t.string :multi_spec_sample_id
      t.string :wavelength
      t.integer :range
      t.float :value
      t.integer :reflectance
      t.boolean :normalized
      t.string :upload_status

      t.timestamps null: false
    end
  end
end
