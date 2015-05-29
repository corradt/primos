class CreateComunications < ActiveRecord::Migration
  def change
    create_table :comunications do |t|
      t.string :title
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
