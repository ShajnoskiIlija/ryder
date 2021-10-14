# frozen_string_literal: true

class RentItem < ApplicationRecord
  belongs_to :user

  validates :location, presence: true

  scope :rent_item_per_type, ->(rent_type) { where(item_type: rent_type) }
end
