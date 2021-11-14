# frozen_string_literal: true

class RentRequest < ApplicationRecord
  validates :status, presence: true

  belongs_to :rent_item
  belongs_to :user
end
