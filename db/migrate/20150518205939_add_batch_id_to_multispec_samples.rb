class AddBatchIdToMultispecSamples < ActiveRecord::Migration
  def change
    add_column :multispectral_samples, :batch_id, :string
  end
end
