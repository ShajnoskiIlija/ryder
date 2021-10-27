# frozen_string_literal: true

class RentItem < ApplicationRecord
  belongs_to :user

  validates :location, :condition, :item_type, presence: true

  scope :rent_item_per_type, ->(rent_type) { where(item_type: rent_type) }
  scope :my_rentals, ->(logged_user, params) { where(id: params, user_id: logged_user.id) }
  scope :bicycle, ->(logged_user, _bicycle) { where(item_type: 'Bicycle', user_id: logged_user.id) }
  scope :scooter, ->(logged_user, _scooter) { where(item_type: 'Electric Scooter', user_id: logged_user.id) }
  scope :summer, ->(logged_user, _summer) { where(item_type: 'Summer Equipment', user_id: logged_user.id) }
  scope :winter, ->(logged_user, _winter) { where(item_type: 'Winter Equipment', user_id: logged_user.id) }
end
