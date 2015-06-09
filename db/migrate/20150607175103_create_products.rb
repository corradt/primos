class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :variety
      t.string :minPrice
      t.string :medPrice
      t.string :maxPrice
      t.string :calibro
      t.string :category
      t.string :origin
      t.string :unitOfMisure
      t.string :group

      t.timestamps
    end
  end
end
