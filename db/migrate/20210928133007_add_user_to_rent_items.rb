class AddUserToRentItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :rent_items, :user, foreign_key: true
  end
end
