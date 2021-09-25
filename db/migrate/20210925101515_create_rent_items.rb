class CreateRentItems < ActiveRecord::Migration[6.1]
  def change
    create_table :rent_items do |t|
      t.string :location
      t.string :condition
      t.string :for_age
      t.string :item_type

      t.timestamps
    end
  end
end
