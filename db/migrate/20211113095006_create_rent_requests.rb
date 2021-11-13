class CreateRentRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :rent_requests do |t|
      t.string :status
      t.belongs_to :user
      t.belongs_to :rent_item

      t.timestamps
    end
  end
end
