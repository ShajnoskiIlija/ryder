# frozen_string_literal: true

class RentItem < ApplicationRecord
  belongs_to :user

  validates :location, :condition, :item_type, presence: true
  validates :item_type, presence: true, if: :item_type_valid?
  validates :available, presence: true

  def item_type_valid?
    ITEM_TYPES.include?(item_type)
  end

  scope :rent_item_per_type, ->(rent_type) { where(item_type: rent_type) }
  scope :my_rentals, ->(logged_user, params) { where(id: params, user_id: logged_user.id) }
end
