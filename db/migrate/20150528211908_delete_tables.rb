class DeleteTables < ActiveRecord::Migration
  def change
  	drop_table :line_items
  	drop_table :carts
  	drop_table :tasks
  	
  end
end
