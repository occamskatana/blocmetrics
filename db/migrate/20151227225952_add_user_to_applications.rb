class AddUserToApplications < ActiveRecord::Migration
  def change
    add_reference :applications, :user, index: true, foreign_key: true
  end
end
