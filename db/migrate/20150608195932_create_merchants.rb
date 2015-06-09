class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :stand
      t.string :ragioneSociale
      t.string :telefono
      t.string :fax
      t.string :referente

      t.timestamps
    end
  end
end
