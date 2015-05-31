class AddRoleToAdmins < ActiveRecord::Migration
  def change
  	add_column :admins, :role,:integer, default:0
  end
end
