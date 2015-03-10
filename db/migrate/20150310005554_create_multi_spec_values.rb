class CreateMultiSpecValues < ActiveRecord::Migration
  def change
    create_table :multi_spec_values do |t|
      t.integer :MultiSpecSample_id
      t.integer :range
      t.integer :value

      t.timestamps null: false
    end
  end
end
