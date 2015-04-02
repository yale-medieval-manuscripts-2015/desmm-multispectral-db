class CreateMultispectralTags < ActiveRecord::Migration
  def change
    create_table :multispectral_tags do |t|
      t.string :hash_tag
      t.string :facet_category
      t.string :facet_value
      t.string :upload_status
      t.references :multispectral_sample, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :multispectral_tags, :multispectral_samples
  end
end
