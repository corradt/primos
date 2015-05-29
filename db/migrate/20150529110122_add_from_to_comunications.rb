class AddFromToComunications < ActiveRecord::Migration
  def change
  	add_column :comunications,:from, :string
  end
end
