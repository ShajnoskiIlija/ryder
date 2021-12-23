class AddAvailableToRentItem < ActiveRecord::Migration[6.1]
  def change
    add_column :rent_items, :available, :boolean, default: true
  end
end
