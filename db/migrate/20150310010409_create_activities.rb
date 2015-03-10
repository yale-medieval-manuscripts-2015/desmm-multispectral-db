class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :MultiSpecSample_id
      t.integer :
      t.string :Status
      t.datetime :UploadedOn
      t.string :UploadedBy

      t.timestamps null: false
    end
  end
end
