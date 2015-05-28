class DeleteNotificationAndProductTables < ActiveRecord::Migration
  def change
  	drop_table :notifications
  	drop_table :products
  end
end
