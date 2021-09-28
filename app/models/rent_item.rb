# frozen_string_literal: true

class RentItem < ApplicationRecord
  belongs_to :user

  validates :location, presence: true
end
