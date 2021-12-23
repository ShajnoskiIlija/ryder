# frozen_string_literal: true

class RentRequest < ApplicationRecord
  belongs_to :rent_item
  belongs_to :user

  STATUSES = %w[pending accepted rejected canceled].freeze
  UPDATE_STATUSES = %w[accepted rejected].freeze

  validates :status, inclusion: { in: UPDATE_STATUSES }, on: :update
end
