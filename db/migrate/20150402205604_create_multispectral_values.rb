class CreateMultispectralValues < ActiveRecord::Migration
  def change
    create_table :multispectral_values do |t|
      t.integer :range
      t.float :value
      t.string :upload_status
      t.references :multispectral_sample, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :multispectral_values, :multispectral_samples
  end
end
