# frozen_string_literal: true

class RentRequest < ApplicationRecord
  belongs_to :rent_item
  belongs_to :user

  STATUSES = %w[pending accepted rejected canceled].freeze
  UPDATE_STATUSES = %w[accepted rejected].freeze

  validates :status, inclusion: { in: UPDATE_STATUSES }, on: :update

  before_create do
    self.status = 'pending'
  end

  after_update do
    RentRequest.where(['rent_item_id = ? and status = ?', rent_item, 'pending']).find_each do |rr|
      rr.update!(status: 'rejected')
    end
  end
end
