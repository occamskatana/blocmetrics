class AddAttributesToRegisteredApplication < ActiveRecord::Migration
  def change
    add_column :registered_applications, :name, :string
    add_column :registered_applications, :url, :string
  end
end
