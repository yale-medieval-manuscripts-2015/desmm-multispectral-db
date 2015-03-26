class ChangeValueFromMultiSpecValues < ActiveRecord::Migration
  def change
    remove_column :multi_spec_values, :value, :integer
    add_column :multi_spec_values, :value, :float
  end
end
