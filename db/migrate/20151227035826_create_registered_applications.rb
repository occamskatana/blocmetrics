class CreateRegisteredApplications < ActiveRecord::Migration
  def change
    create_table :registered_applications do |t|
      t.references :users, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
