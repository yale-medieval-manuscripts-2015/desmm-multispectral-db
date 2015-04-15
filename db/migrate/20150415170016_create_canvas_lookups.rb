class CreateCanvasLookups < ActiveRecord::Migration
  def change
    create_table :canvas_lookups do |t|
      t.string :canvas_id
      t.string :object_file_id

      t.timestamps null: false
    end
    add_index :canvas_lookups, :canvas_id
    add_index :canvas_lookups, :object_file_id
  end
end
