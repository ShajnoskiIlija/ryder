# frozen_string_literal: true

class RentItem < ApplicationRecord
  belongs_to :user
  has_many :rent_requests, dependent: :destroy
  has_many :image_elements, dependent: :destroy

  validates :location, :condition, :item_type, presence: true
  validates :item_type, presence: true, if: :item_type_valid?

  def item_type_valid?
    ITEM_TYPES.include?(item_type)
  end

  scope :rent_item_per_type, ->(rent_type) { where(item_type: rent_type) }
  scope :my_rentals, ->(logged_user) { where(user_id: logged_user.id) }
end
